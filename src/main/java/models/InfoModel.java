package models;

public class InfoModel {
    private String group;
    private String description;
    private String namespace;
    private String brief;
    private String file;
    private String path;
    private String name;

    public String getDescription() {
        return description;
    }

    public String getNamespace() {
        return namespace;
    }

    public String getName() {
        return name;
    }

    public String getBrief() {
        return brief;
    }

    public String getGroup() { return group; }

    public String getFile() { return file; }

    public String getPath() { return path; }
}
