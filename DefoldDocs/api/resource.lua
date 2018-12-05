---Resource API documentation
---Functions and constants to access resources.
---@class resource
resource = {}
---LIVEUPDATE_BUNDLED_RESOURCE_MISMATCH
resource.LIVEUPDATE_BUNDLED_RESOURCE_MISMATCH = nil
---LIVEUPDATE_ENGINE_VERSION_MISMATCH
resource.LIVEUPDATE_ENGINE_VERSION_MISMATCH = nil
---LIVEUPDATE_FORMAT_ERROR
resource.LIVEUPDATE_FORMAT_ERROR = nil
---LIVEUPDATE_INVALID_RESOURCE
resource.LIVEUPDATE_INVALID_RESOURCE = nil
---LIVEUPDATE_OK
resource.LIVEUPDATE_OK = nil
---LIVEUPDATE_SCHEME_MISMATCH
resource.LIVEUPDATE_SCHEME_MISMATCH = nil
---LIVEUPDATE_SIGNATURE_MISMATCH
resource.LIVEUPDATE_SIGNATURE_MISMATCH = nil
---LIVEUPDATE_VERSION_MISMATCH
resource.LIVEUPDATE_VERSION_MISMATCH = nil
---luminance type texture format
resource.TEXTURE_FORMAT_LUMINANCE = nil
---RGB type texture format
resource.TEXTURE_FORMAT_RGB = nil
---RGBA type texture format
resource.TEXTURE_FORMAT_RGBA = nil
---2D texture type
resource.TEXTURE_TYPE_2D = nil
---Return a reference to the Manifest that is currently loaded.
---@return number reference to the Manifest that is currently loaded
function resource.get_current_manifest() end
---Loads the resource data for a specific resource.
---@param path string The path to the resource
---@return buffer Returns the buffer stored on disc
function resource.load(path) end
---Sets the resource data for a specific resource
---@param path string | hash The path to the resource
---@param buffer buffer The buffer of precreated data, suitable for the intended resource type
function resource.set(path, buffer) end
---Sets the pixel data for a specific texture.
---@param path hash | string The path to the resource
---@param table table A table containing info about the texture. Supported entries:
---@param buffer buffer The buffer of precreated pixel data
function resource.set_texture(path, table, buffer) end
---Create a new manifest from a buffer. The created manifest is verified
---by ensuring that the manifest was signed using the bundled public/private
---key-pair during the bundle process and that the manifest supports the current
---running engine version. Once the manifest is verified it is stored on device.
---The next time the engine starts (or is rebooted) it will look for the stored
---manifest before loading resources. Storing a new manifest allows the
---developer to update the game, modify existing resources, or add new
---resources to the game through LiveUpdate.
---@param manifest_buffer string the binary data that represents the manifest
---@param callback function(self, status) the callback function executed once the engine has attempted to store the manifest.
function resource.store_manifest(manifest_buffer, callback) end
---add a resource to the data archive and runtime index. The resource will be verified
---internally before being added to the data archive.
---@param manifest_reference number The manifest to check against.
---@param data string The resource data that should be stored.
---@param hexdigest string The expected hash for the resource, retrieved through collectionproxy.missing_resources.
---@param callback function(self, hexdigest, status) The callback function that is executed once the engine has been attempted to store the resource.
function resource.store_resource(manifest_reference, data, hexdigest, callback) end



return resource