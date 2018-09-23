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
             "---@class SysInfo\n" +
            "---@field device_model string \n" +
            "---@field manufacturer string\n" +
            "---@field system_name string\n" +
            "---@field system_version string\n" +
            "---@field api_version string\n" +
            "---@field language string\n" +
            "---@field device_language string\n" +
            "---@field territory string\n" +
            "---@field gmt_offset string\n" +
            "---@field device_ident string\n" +
            "---@field ad_ident string\n" +
            "---@field ad_tracking_enabled string\n" +
            "---@field user_agent string";


    public static String get_param_class(String clazz, String funName, String param, String paramClass) {
        if(clazz.equals("sys") && funName.equals("sys.get_sys_info")){
            return "SysInfo";
        }

        return  paramClass;
    }
}
