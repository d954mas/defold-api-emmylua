package models;

import com.google.gson.JsonArray;

import java.util.List;
import java.util.Objects;

public class ElementModel implements Comparable<ElementModel> {
    private String replaces;
    private String description;
    private List<ParameterModel> parameters;
    private List<ParameterModel> returnvalues;
    private JsonArray notes;
    private String brief;
    private String examples;
    private JsonArray members;
    private String error;
    private JsonArray tparams;
    private String type;
    private String name;



    public String getReplaces() {
        return replaces;
    }

    public String getDescription() {
        return description;
    }

    public String getBrief() {
        return brief;
    }

    public String getExamples() {
        return examples;
    }

    public String getError() {
        return error;
    }

    public String getType() {
        return type;
    }

    public String getName() {
        return name;
    }

    public List<ParameterModel> getParameters() {
        return parameters;
    }

    public List<ParameterModel> getReturnvalues() {
        return returnvalues;
    }

    public JsonArray getNotes() { return notes; }

    public JsonArray getMembers() { return members; }

    public JsonArray getTparams() { return tparams; }

    public String getClassName() {
        return name.split("\\.")[0];
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ElementModel that = (ElementModel) o;
        return Objects.equals(replaces, that.replaces) &&
                Objects.equals(description, that.description) &&
                Objects.equals(brief, that.brief) &&
                Objects.equals(examples, that.examples) &&
                Objects.equals(error, that.error) &&
                Objects.equals(type, that.type) &&
                Objects.equals(name, that.name) &&
                Objects.equals(parameters, that.parameters) &&
                Objects.equals(returnvalues, that.returnvalues);
    }

    @Override
    public int hashCode() {
        return Objects.hash(replaces, description, brief, examples, error, type, name, parameters, returnvalues);
    }

    @Override
    public int compareTo(ElementModel o) {
        return name.compareTo(o.name);
    }
}
