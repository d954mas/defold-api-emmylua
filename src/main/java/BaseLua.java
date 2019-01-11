import models.ParameterModel;

public class BaseLua {
    public static String BASE = "---@class vector3\n" +
            "---@field x number\n" +
            "---@field y number\n" +
            "---@field z number\n" +
            "\n" +
            "---@class vector4\n" +
            "---@field x number\n" +
            "---@field y number\n" +
            "---@field z number\n" +
            "---@field w number\n" +
            "\n" +
            "---@class url\n"+
            "---@field socket\n"+
            "---@field path\n"+
            "---@field fragment\n"
            + "\n" +
            "--- Calls error if the value of its argument `v` is false (i.e., **nil** or\n" +
            "--- **false**); otherwise, returns all its arguments. In case of error,\n" +
            "--- `message` is the error object; when absent, it defaults to \"assertion\n" +
            "--- failed!\"\n" +
            "---@generic ANY\n" +
            "---@overload fun(v:any):any\n" +
            "---@param v ANY\n" +
            "---@param message string\n" +
            "---@return ANY\n" +
            "function assert(v,message)" +
            " return v " +
            "end";
}
