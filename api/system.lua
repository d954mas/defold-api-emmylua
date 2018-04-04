--System API documentation
--Functions and messages for using system resources, controlling the engine,
--error handling and debugging.
---@class sys
local sys = {}
    sys.NETWORK_CONNECTED = nil
    sys.NETWORK_CONNECTED_CELLULAR = nil
    sys.NETWORK_DISCONNECTED = nil
---Returns a table with application information for the requested app.
--- On iOS, the app_string is an url scheme for the app that is queried. Your
---game needs to list the schemes that are queried in an LSApplicationQueriesSchemes array
---in a custom "Info.plist".
--- On Android, the app_string is the package identifier for the app.
---@param app_string string platform specific string with application package or query, see above for details.
---@return table|boolean table with application information in the following fields: <dl> <dt>installed</dt> <dd> true if the application is installed, false otherwise.</dd> </dl>
    function sys.get_application_info(app_string) end
---Get config value from the game.project configuration file.
---@param key string key to get value for. The syntax is SECTION.KEY
---@return string config value as a string. nil if the config key doesn't exists
    function sys.get_config(key) end
---  Returns the current network connectivity status
---on mobile platforms.
---On desktop, this function always return sys.NETWORK_CONNECTED.
    function sys.get_connectivity() end
---Returns a table with engine information.
    function sys.get_engine_info() end
---Returns an array of tables with information on network interfaces.
    function sys.get_ifaddrs() end
---The save-file path is operating system specific and is typically located under the user's home directory.
---@param application_id string user defined id of the application, which helps define the location of the save-file
---@param file_name string file-name to get path for
---@return string path to save-file
    function sys.get_save_file(application_id, file_name) end
---Returns a table with system information.
    function sys.get_sys_info() end
---If the file exists, it must have been created by sys.save to be loaded.
---@param filename string file to read from
---@return table lua table, which is empty if the file could not be found
    function sys.load(filename) end
---Loads a custom resource. Specify the full filename of the resource that you want
---to load. When loaded, the file data is returned as a string.
---If loading fails, the function returns nil.
---In order for the engine to include custom resources in the build process, you need
---to specify them in the "custom_resources" key in your "game.project" settings file.
---You can specify single resource files or directories. If a directory is is included
---in the resource list, all files and directories in that directory is recursively
---included:
---For example "main/data/,assets/level_data.json".
---@param filename string resource to load, full path
---@return string loaded data, or nil if the resource could not be loaded
    function sys.load_resource(filename) end
---Open URL in default application, typically a browser
---@param url string url to open
---@return boolean a boolean indicating if the url could be opened or not
    function sys.open_url(url) end
---The table can later be loaded by sys.load.
---Use sys.get_save_file to obtain a valid location for the file.
---Internally, this function uses a workspace buffer sized output file sized 512kb.
---This size reflects the output file size which must not exceed this limit.
---Additionally, the total number of rows that any one table may contain is limited to 65536
---(i.e. a 16 bit range). When tables are used to represent arrays, the values of
---keys are permitted to fall within a 32 bit range, supporting sparse arrays, however
---the limit on the total number of rows remains in effect.
---@param filename string file to write to
---@param table table lua table to save
---@return boolean a boolean indicating if the table could be saved or not
    function sys.save(filename, table) end
---Sets the host that is used to check for network connectivity against.
---@param host string hostname to check against
    function sys.set_connectivity_host(host) end
---Set the Lua error handler function.
---The error handler is a function which is called whenever a lua runtime error occurs.
---@param error_handler function(source, message, traceback)|string|string|string the function to be called on error <dl> <dt>source</dt> <dd> The runtime context of the error. Currently, this is always "lua".</dd> <dt>message</dt> <dd> The source file, line number and error message.</dd> <dt>traceback</dt> <dd> The stack traceback.</dd> </dl>
    function sys.set_error_handler(error_handler) end
return sys