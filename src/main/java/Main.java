import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import io.reactivex.Flowable;
import io.reactivex.Single;
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
Parse defold docs, and generate lua files for IntelliJ. Ignore members param.Looks it is for c++ structures.
 */

public class Main {
    public static final String GET_LAST_VERSION_URL = "http://d.defold.com/stable/info.json";
    public static final Set<String> IGNORE_DOCS = new HashSet<>();
    public static final String FOLDER = "DefoldDocs";

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

    public static void main(String[] args) {
        File apiDir = new File(new File(System.getProperty("java.io.tmpdir")), FOLDER + "/api");
        File[] files = apiDir.listFiles();
        if (files != null) {
            for (File f : files) {
                f.delete();
            }
        }
        apiDir.mkdirs();
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
            luaBuilder.setInfoModel(d.getInfoModel());
            for (ElementModel elementModel : d.getElements()) {
                if (elementModel.getType().equals("FUNCTION")) {
                    luaBuilder.addFun(elementModel);
                } else if (elementModel.getType().equals("VARIABLE")) {
                    luaBuilder.addVar(elementModel);
                } else if (elementModel.getType().equals("MESSAGE")) {

                } else if (elementModel.getType().equals("MACRO")) {

                } else if (elementModel.getType().equals("ENUM")) {

                } else if (elementModel.getType().equals("TYPEDEF")) {

                } else if (elementModel.getType().equals("STRUCT")) {

                } else if (elementModel.getType().equals("PROPERTY")) {

                }
            }
            try (PrintWriter writer = new PrintWriter(new File("C:\\Users\\d954mas\\Desktop\\defold_api",
                    d.getInfoModel().getName().replaceAll(" ", "_").toLowerCase() + ".lua"))) {
                writer.write(luaBuilder.build());
            }
        }).toList().toFlowable().blockingSubscribe(docModel -> {
            System.out.println("Saved to:" + new File(new File(System.getProperty("java.io.tmpdir")), FOLDER + "/api")
                    .getAbsolutePath());
        }, Throwable::printStackTrace);

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
                return element.getAsJsonObject().get("sha1").getAsString();
            }
        }).subscribeOn(Schedulers.io());
    }


    public static Single<File> downloadDocs(String sha) {
        return Single.fromCallable(() -> {
            URL website = new URL("http://d.defold.com/archive/" + sha + "/engine/share/ref-doc.zip");
            try (ZipInputStream io = new ZipInputStream((website.openStream()))) {
                File tempDir = new File(new File(System.getProperty("java.io.tmpdir")), FOLDER);
                tempDir.mkdirs();
                ZipEntry ze = io.getNextEntry();
                byte[] buffer = new byte[1024];
                while (ze != null) {
                    String fileName = ze.getName();
                    if (fileName.endsWith(".json")) {
                        File newFile = new File(tempDir, fileName);
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
                return new File(tempDir, "doc");
            }
        }).subscribeOn(Schedulers.io()).observeOn(Schedulers.io());

    }
}
