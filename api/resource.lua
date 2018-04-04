--Resource API documentation
--Functions and constants to access resources.
---@class resource
local resource = {}
    resource.TEXTURE_FORMAT_LUMINANCE = nil
    resource.TEXTURE_FORMAT_RGB = nil
    resource.TEXTURE_FORMAT_RGBA = nil
    resource.TEXTURE_TYPE_2D = nil
---Return a reference to the Manifest that is currently loaded.
    function resource.get_current_manifest() end
---Loads the resource data for a specific resource.
---@param path string | hash The path to the resource
---@return buffer Returns the buffer stored on disc
    function resource.load(path) end
---Sets the resource data for a specific resource
---@param path string | hash The path to the resource
---@param buffer buffer The buffer of precreated data, suitable for the intended resource type
    function resource.set(path, buffer) end
---Sets the pixel data for a specific texture.
---@param path hash | string The path to the resource
---@param table table|number|number|number|number A table containing info about the texture. Supported entries: <dl> <dt>type</dt> <dd> The texture type. Supported values:</dd> </dl> <ul> resource.TEXTURE_TYPE_2D </ul> <dl> <dt>width</dt> <dd> The width of the texture (in pixels)</dd> <dt>height</dt> <dd> The width of the texture (in pixels)</dd> <dt>format</dt> <dd> The texture format. Supported values:</dd> </dl> <ul> resource.TEXTURE_FORMAT_LUMINANCE resource.TEXTURE_FORMAT_RGB resource.TEXTURE_FORMAT_RGBA </ul>
---@param buffer buffer The buffer of precreated pixel data  Currently, only 1 mipmap is generated.
    function resource.set_texture(path, table, buffer) end
---add a resource to the data archive and runtime index. The resource will be verified
---internally before being added to the data archive.
---@param manifest_reference number The manifest to check against.
---@param data string The resource data that should be stored.
---@param hexdigest string The expected hash for the resource, retrieved through collectionproxy.missing_resources.
---@param callback function(self, hexdigest, status)|object|string|boolean The callback function that is executed once the engine has been attempted to store the resource. <dl> <dt>self</dt> <dd> The current object.</dd> <dt>hexdigest</dt> <dd> The hexdigest of the resource.</dd> <dt>status</dt> <dd> Whether or not the resource was successfully stored.</dd> </dl>
    function resource.store_resource(manifest_reference, data, hexdigest, callback) end
return resource