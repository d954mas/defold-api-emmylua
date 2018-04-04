--Image API documentation
--Functions for creating image objects.
---@class image
local image = {}
    image.TYPE_LUMINANCE = nil
    image.TYPE_RGB = nil
    image.TYPE_RGBA = nil
---Load image (PNG or JPEG) from buffer.
---@param buffer string image data buffer
---@param [premult] boolean optional flag if alpha should be premultiplied. Defaults to false
---@return table|number|number|constant|string object or nil if loading fails. The object is a table with the following fields: <ul>  width: image width  height: image height  type: image type<ul> image.TYPE_RGB image.TYPE_RGBA image.TYPE_LUMINANCE </ul>   buffer: the raw image data </ul>
    function image.load(buffer, premult) end
return image