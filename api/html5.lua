---HTML5 API documentation
---HTML5 platform specific functions.
---
--- The following functions are only available on HTML5 builds, the html5.* Lua namespace will not be available on other platforms.
---@class html5
local html5 = {}
---Executes the supplied string as JavaScript inside the browser.
---A call to this function is blocking, the result is returned as-is, as a string.
---(Internally this will execute the string using the eval() JavaScript function.)
---@param code string Javascript code to run
---@return result string result as string
function html5.run(code) end

return html5