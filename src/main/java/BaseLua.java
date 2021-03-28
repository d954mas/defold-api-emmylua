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
            "---@class quaternion\n" +
            "---@field x number\n" +
            "---@field y number\n" +
            "---@field z number\n" +
            "---@field w number\n" +
            "\n" +
            "---@alias quat quaternion\n" +
            "\n" +
            "---@class url\n" +
            "---@field socket\n" +
            "---@field path\n" +
            "---@field fragment\n" +
            "\n" +
            "---@alias hash userdata\n" +
            "---@alias constant userdata\n" +
            "---@alias bool boolean\n" +
            "---@alias float number\n" +
            "---@alias object userdata\n" +
            "---@alias matrix4 userdata\n" +
            "---@alias node userdata\n" +
            "\n" +
            "--mb use number instead of vector4\n" +
            "---@alias vector vector4\n" +
            "\n" +
            "--luasocket\n" +
            "---@alias master userdata\n" +
            "---@alias unconnected userdata\n" +
            "---@alias client userdata\n" +
            "\n" +
            "--render\n" +
            "---@alias constant_buffer userdata\n" +
            "---@alias render_target userdata\n" +
            "---@alias predicate userdata\n" +
            "\n" +
            "--- Calls error if the value of its argument `v` is false (i.e., **nil** or\n" +
            "--- **false**); otherwise, returns all its arguments. In case of error,\n" +
            "--- `message` is the error object; when absent, it defaults to \"assertion\n" +
            "--- failed!\"\n" +
            "---@generic ANY\n" +
            "---@overload fun(v:any):any\n" +
            "---@param v ANY\n" +
            "---@param message string\n" +
            "---@return ANY\n" +
            "function assert(v,message) return v end";
}
