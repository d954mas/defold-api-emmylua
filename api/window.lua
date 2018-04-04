--Window API documentation
--Functions and constants to access the window, window event listeners
--and screen dimming.
---@class window
local window = {}
    window.DIMMING_OFF = nil
    window.DIMMING_ON = nil
    window.DIMMING_UNKNOWN = nil
    window.WINDOW_EVENT_FOCUS_GAINED = nil
    window.WINDOW_EVENT_FOCUS_LOST = nil
    window.WINDOW_EVENT_RESIZED = nil
---  Returns the current dimming mode set on a mobile device.
---The dimming mode specifies whether or not a mobile device should dim the screen after a period without user interaction.
---On platforms that does not support dimming, window.DIMMING_UNKNOWN is always returned.
    function window.get_dim_mode() end
---  Sets the dimming mode on a mobile device.
---The dimming mode specifies whether or not a mobile device should dim the screen after a period without user interaction. The dimming mode will only affect the mobile device while the game is in focus on the device, but not when the game is running in the background.
---This function has no effect on platforms that does not support dimming.
---@param mode constant The mode for screen dimming <ul> window.DIMMING_ON window.DIMMING_OFF </ul>
    function window.set_dim_mode(mode) end
---Sets a window event listener.
---@param callback function(self, event, data)|object|constant|table|number|number A callback which receives info about window events. Pass an empty function if you no longer wish to receive callbacks. <dl> <dt>self</dt> <dd> The calling script</dd> <dt>event</dt> <dd> The type of event. Can be one of these:</dd> </dl> <ul> window.WINDOW_EVENT_FOCUS_LOST window.WINDOW_EVENT_FOCUS_GAINED window.WINDOW_EVENT_RESIZED </ul> <dl> <dt>data</dt> <dd> The callback value data is a table which currently holds these values</dd> </dl> <ul>  width: The width of a resize event. nil otherwise.  height: The height of a resize event. nil otherwise. </ul>
    function window.set_listener(callback) end
return window