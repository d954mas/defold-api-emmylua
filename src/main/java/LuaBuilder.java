import models.ElementModel;
import models.InfoModel;
import models.ParameterModel;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LuaBuilder {
    private InfoModel infoModel;
    private Map<String, ClassBuilder> classMap = new LinkedHashMap<>();
    private static String REPLACE_ALL_TAGS = "</?(p|span|div|code|ui|li).*?/?>";
    public String build() {
        StringBuilder builder = new StringBuilder();
        builder.append("--").append(formatString(infoModel.getBrief())).append("\n");
        builder.append("--").append(formatString(infoModel.getDescription())).append("\n");
        for (ClassBuilder classBuilder : classMap.values()) {
            classBuilder.build(builder);
        }

        if (classMap.size() > 0) {
            builder.append("return ").append(classMap.values().iterator().next().getName());
        }

        return builder.toString();
    }

    private ClassBuilder getClass(ElementModel em) {
        ClassBuilder cb = classMap.get(em.getClassName());
        if (cb == null) {
            cb = new ClassBuilder();
            cb.name = em.getClassName();
            classMap.put(cb.name, cb);
        }
        return cb;
    }


    public void addVar(ElementModel em) {
        getClass(em).addVar(em);
    }

    public void addFun(ElementModel em) {
        getClass(em).addFun(em);
    }

    public void setInfoModel(InfoModel infoModel) {
        this.infoModel = infoModel;
    }

    private class ClassBuilder {
        private String name;
        private Set<ElementModel> vars = new TreeSet<>();
        private Set<ElementModel> funs = new TreeSet<>();
        Pattern spanParam = Pattern.compile("<span class=\"type\">([^<&]+)</span>");
        Pattern commentParam = Pattern.compile("<p>([^<&]+)</p>");
        public String getName() {
            return name;
        }

        private String getParamString(ParameterModel parameterModel){
            StringBuilder builder = new StringBuilder();
            builder.append("---@param ");
            builder.append(parameterModel.getFormatName()).append(" ");
            Matcher m = spanParam.matcher(parameterModel.getDoc());
            while (m.find())
            {
                builder.append(m.group(1));
                builder.append("|");
            }
            builder.setLength(builder.length()-1);
            String comment = parameterModel.getDoc().replaceAll("<span class=\"type\">([^<&]+)</span>","")
                    .replaceAll(REPLACE_ALL_TAGS,"").replaceAll("\n"," ");
            builder.append(comment);
           return builder.toString();
        }

        private String getReturnString(ParameterModel parameterModel){
            StringBuilder builder = new StringBuilder();
            builder.append("---@return ");
            Matcher m = spanParam.matcher(parameterModel.getDoc());
            while (m.find())
            {
                builder.append(m.group(1));
                builder.append("|");
            }
            builder.setLength(builder.length()-1);
            String comment = parameterModel.getDoc().replaceAll("<span class=\"type\">([^<&]+)</span>","")
                    .replaceAll(REPLACE_ALL_TAGS,"").replaceAll("\n"," ");
            builder.append(comment);
            return builder.toString();
        }


        public void addVar(ElementModel parameterModel) {
            vars.add(parameterModel);
        }

        public void addFun(ElementModel parameterModel) {
            funs.add(parameterModel);
        }

        public void build(StringBuilder builder) {
            builder.append("---@class ").append(name).append("\n");
            builder.append("local ").append(name).append(" = {}\n");
            for (ElementModel var : vars) {
                builder.append("    ").append(var.getName()).append(" = nil").append("\n");
            }
            for (ElementModel fun : funs) {
                if (!fun.getDescription().equals("")) {
                    builder.append("---").append(formatString(fun.getDescription()).replaceAll("--","---")).append("\n");
                }
                if (fun.getParameters().size() > 0) {
                    for (ParameterModel parameterModel : fun.getParameters()) {
                       builder.append(getParamString(parameterModel)).append("\n");
                    }
                    for (ParameterModel parameterModel : fun.getReturnvalues()) {
                        builder.append(getReturnString(parameterModel)).append("\n");
                    }
                }


                builder.append("    ").append("function ").append(fun.getName()).append("(");
                if (fun.getParameters().size() > 0) {
                    for (ParameterModel parameterModel : fun.getParameters()) {
                        if (parameterModel.getName().endsWith("...]")) {
                            builder.append("...");
                        } else {
                            builder.append(parameterModel.getName().replaceAll("\\[|\\]", ""));
                        }
                        builder.append(", ");
                    }
                    builder.setLength(builder.length() - 2);
                }
                builder.append(") end\n");
            }
        }
    }

    public static String formatString(String s) {
        s = s.replaceAll(REPLACE_ALL_TAGS, "")
                .replaceAll("&quot;", "\"")
                .replaceAll("\\n", "\n--");
        if (s.endsWith("--")) {
            s = s.substring(0, s.length() - 2);
        }
        if (s.endsWith("\n")) {
            s = s.substring(0, s.length() - 1);
        }
        return s;
    }
}
