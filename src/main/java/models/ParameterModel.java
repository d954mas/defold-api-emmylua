package models;

public class ParameterModel {
    private String doc, name;

    public String getDoc() {
        return doc;
    }

    public String getName() {
        return name;
    }

    public String getFormatName() {
        name = name.replaceAll("-|(\"\\*\")", "_");
        if (name.endsWith("...]")) {
            return "...";
        }
        if (name.contains("[")) {
            return name.replaceAll("\\[|\\]", "");
        }
        return name;
    }

}
