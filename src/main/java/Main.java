import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import io.reactivex.Flowable;
import io.reactivex.Single;
import io.reactivex.functions.Action;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;
import models.DocModel;
import models.ElementModel;

import java.io.*;
import java.net.URL;
import java.util.HashSet;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/*
Parse defold docs, and generate lua files for IntelliJ. Ignore c++ and messages.
 */

public class Main {
    public static final String GET_LAST_VERSION_URL = "http://d.defold.com/stable/info.json";
    public static final Set<String> IGNORE_DOCS = new HashSet<>();
    public static final File TEMP_FOLDER = new File(System.getProperty("java.io.tmpdir"), "DefoldDocs");
    public static final File API_FOLDER = new File(TEMP_FOLDER, "api");

    static {
        IGNORE_DOCS.add("base_doc.json");
        IGNORE_DOCS.add("buffer_doc.json");
        IGNORE_DOCS.add("camera_doc.json");
        IGNORE_DOCS.add("coroutine_doc.json");
        IGNORE_DOCS.add("crash_doc.json");
        IGNORE_DOCS.add("debug_doc.json");
        IGNORE_DOCS.add("dmAlign_doc.json");
        IGNORE_DOCS.add("dmArray_doc.json");
        IGNORE_DOCS.add("dmBuffer_doc.json");
        IGNORE_DOCS.add("dmConfigFile_doc.json");
        IGNORE_DOCS.add("dmExtension_doc.json");
        IGNORE_DOCS.add("dmGraphics_doc.json");
        IGNORE_DOCS.add("dmHash_doc.json");
        IGNORE_DOCS.add("dmLog_doc.json");
        IGNORE_DOCS.add("dmScript_doc.json");
        IGNORE_DOCS.add("package_doc.json");
        IGNORE_DOCS.add("sharedlibrary_doc.json");
        IGNORE_DOCS.add("table_doc.json");
        IGNORE_DOCS.add("dmScript_doc.json");
    }

    private static void clearFolder(File folder) {
        File[] files = folder.listFiles();
        if (files != null) {
            for (File f : files) {
                if (f.isDirectory()) {
                    clearFolder(f);
                }
                f.delete();
            }
        }
    }

    public static void main(String[] args) {
        clearFolder(TEMP_FOLDER);
        TEMP_FOLDER.mkdirs();
        API_FOLDER.mkdirs();
        Gson gson = new Gson();
        Single<String> lastShaSingle = args.length == 0 ? getLastDefoldSha() : Single.just(args[0]);
        lastShaSingle.flatMap(Main::downloadDocs).toFlowable()
                .flatMap(file -> Flowable.fromArray(file.listFiles()))
                .filter(file -> !IGNORE_DOCS.contains(file.getName()))
                .map((Function<File, DocModel>) file -> {
                    try (JsonReader reader = new JsonReader(new FileReader(file))) {
                        return gson.fromJson(reader, DocModel.class);
                    }
                }).doOnEach(docModelNotification -> {
            if (docModelNotification.isOnComplete()) {
                return;
            }
            DocModel d = docModelNotification.getValue();
            LuaBuilder luaBuilder = new LuaBuilder();
            try (PrintWriter writer = new PrintWriter(new File(API_FOLDER,
                    d.getInfoModel().getName().replaceAll(" ", "_").toLowerCase() + ".lua"))) {
                writer.write(luaBuilder.build(d));
            }
        }).toList().toFlowable().blockingSubscribe(docModel -> {
            System.out.println(
                    "Saved to:" + new File(new File(System.getProperty("java.io.tmpdir")), TEMP_FOLDER + "/api")
                            .getAbsolutePath());
        }, Throwable::printStackTrace, () -> {
            try (PrintWriter writer = new PrintWriter(new File(API_FOLDER, "base.lua"))) {
                writer.write(BaseLua.BASE);
            }
        });

    }

    public static Single<String> getLastDefoldSha() {
        return Single.fromCallable(() -> {
            URL website = new URL(GET_LAST_VERSION_URL);
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(website.openStream()))) {
                String jsonStr = "";
                while (reader.ready()) {
                    jsonStr += reader.readLine();
                }
                JsonElement element = new JsonParser().parse(jsonStr);
                String sha = element.getAsJsonObject().get("sha1").getAsString();
                String version = element.getAsJsonObject().get("version").getAsString();
                System.out.println("version:" + version);
                System.out.println("sha1:" + sha);
                return sha;
            }
        }).subscribeOn(Schedulers.io());
    }


    public static Single<File> downloadDocs(String sha) {
        return Single.fromCallable(() -> {
            URL website = new URL("http://d.defold.com/archive/" + sha + "/engine/share/ref-doc.zip");
            try (ZipInputStream io = new ZipInputStream((website.openStream()))) {
                ZipEntry ze = io.getNextEntry();
                byte[] buffer = new byte[1024];
                while (ze != null) {
                    String fileName = ze.getName();
                    if (fileName.endsWith(".json")) {
                        File newFile = new File(TEMP_FOLDER, fileName);
                        newFile.getParentFile().mkdirs();
                        newFile.createNewFile();
                        try (FileOutputStream fos = new FileOutputStream(newFile)) {
                            int len;
                            while ((len = io.read(buffer)) > 0) {
                                fos.write(buffer, 0, len);
                            }
                        }
                    }
                    ze = io.getNextEntry();
                }
                io.closeEntry();
                return new File(TEMP_FOLDER, "/doc");
            }
        }).subscribeOn(Schedulers.io()).observeOn(Schedulers.io());

    }
}
