---Zlib compression API documentation
---Functions for compression and decompression of string buffers.
---@class zlib
local zlib = {}
---A lua error is raised is on error
---@param buf string buffer to deflate
---@return buf string deflated buffer
function zlib.deflate(buf) end
---A lua error is raised is on error
---@param buf string buffer to inflate
---@return buf string inflated buffer
function zlib.inflate(buf) end

return zlib