package models;

import java.util.List;

public class ParameterModel {
    private String doc, name;
    private List<String> types;

    public String getDoc() {
        return doc;
    }

    public String getName() {
        return name;
    }

    public List<String> getTypes() {
        return types;
    }

    public String getFormatName() {
        name = name.replaceAll("-|(\"\\*\")", "_");
        if (name.equals("repeat")) {
            name = "_repeat";
        }
        if (name.endsWith("...]")) {
            return "...";
        }
        if (name.contains("[")) {
            return name.replaceAll("\\[|\\]", "");
        }

        return name;
    }

}
