---JSON API documentation
---Manipulation of JSON data strings.
---@class json
local json = {}
---Decode a string of JSON data into a Lua table.
---A Lua error is raised for syntax errors.
---@param json string json data
---@return data table decoded json
function json.decode(json) end

return json