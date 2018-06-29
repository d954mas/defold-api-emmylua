--[[Create a timer
Adds a timer and returns a unique handle

You may create more timers from inside a timer callback.

Using a delay of 0 will result in a timer that triggers at the next frame just before
script update functions.

If you want a timer that triggers on each frame, set delay to 0.0f and repeat to true.

Timers created within a script will automatically die when the script is deleted.

--]]
---@class timer
---@field INVALID_TIMER_HANDLE number
local timer = {}

---Create timer
---@param delay number time interval in seconds
---@param repeat_ boolean true = repeat timer until cancel, false = one-shot timer
---@param callback function (self, handle, time_elapsed) timer callback function
---@return number handle identifier for the create timer, returns timer.INVALID_TIMER_HANDLE if the timer can not be created
function timer.delay(delay, repeat_, callback) end

---Cancel a timer

---You may cancel a timer from inside a timer callback.
---Cancelling a timer that is already executed or cancelled is safe.

---@param handle 
---@return boolean true if the timer was active, false if the timer is already cancelled / complete
function timer.cancel(handle) end
return timer