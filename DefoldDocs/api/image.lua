---Image API documentation
---Functions for creating image objects.
---@class image
image = {}
---luminance image type
image.TYPE_LUMINANCE = nil
---RGB image type
image.TYPE_RGB = nil
---RGBA image type
image.TYPE_RGBA = nil
---Load image (PNG or JPEG) from buffer.
---@param buffer string image data buffer
---@param premult boolean optional flag if alpha should be premultiplied. Defaults to 
---@return table object or 
function image.load(buffer, premult) end



return image