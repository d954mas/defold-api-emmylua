---@class vector3
---@field x number
---@field y number
---@field z number

---@class vector4
---@field x number
---@field y number
---@field z number
---@field w number

---@class url
---@field socket
---@field path
---@field fragment

--- Calls error if the value of its argument `v` is false (i.e., **nil** or
--- **false**); otherwise, returns all its arguments. In case of error,
--- `message` is the error object; when absent, it defaults to "assertion
--- failed!"
---@generic ANY
---@overload fun(v:any):any
---@param v ANY
---@param message string
---@return ANY
function assert(v,message) return v end