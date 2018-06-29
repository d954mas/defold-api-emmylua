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
            "---@field w number";


    //tmp autocomplite for plugin
    public static String TIMER_TMP = "--[[Create a timer\n" +
            "Adds a timer and returns a unique handle\n" +
            "\n" +
            "You may create more timers from inside a timer callback.\n" +
            "\n" +
            "Using a delay of 0 will result in a timer that triggers at the next frame just before\n" +
            "script update functions.\n" +
            "\n" +
            "If you want a timer that triggers on each frame, set delay to 0.0f and repeat to true.\n" +
            "\n" +
            "Timers created within a script will automatically die when the script is deleted.\n" +
            "\n--]]" +
            "\n---@class timer\n" +
            "---@field INVALID_TIMER_HANDLE number\n" +
            "local timer = {}\n" +
            "\n" +
            "---Create timer\n" +
            "---@param delay number time interval in seconds\n" +
            "---@param repeat_ boolean true = repeat timer until cancel, false = one-shot timer\n" +
            "---@param callback function (self, handle, time_elapsed) timer callback function\n" +
            "---@return number handle identifier for the create timer, returns timer.INVALID_TIMER_HANDLE if the timer can not be created\n" +
            "function timer.delay(delay, repeat_, callback) end\n" +
            "\n" +
            "---Cancel a timer\n" +
            "\n" +
            "---You may cancel a timer from inside a timer callback.\n" +
            "---Cancelling a timer that is already executed or cancelled is safe.\n" +
            "\n" +
            "---@param handle \n" +
            "---@return boolean true if the timer was active, false if the timer is already cancelled / complete\n" +
            "function timer.cancel(handle) end\n"+
            "return timer";
}
