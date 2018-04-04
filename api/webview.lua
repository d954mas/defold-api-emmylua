--Webview API documentation
--Functions and for creating and controlling webviews to show html pages
--or evaluate javascript.
---@class webview
local webview = {}
---Creates a webview instance. It can show HTML pages as well as evaluate Javascript.
---The view remains hidden until the first call.
--- On iOS, the callback will never get a webview.CALLBACK_RESULT_EVAL_ERROR,
---due to the iOS SDK implementation.
---@param callback function(self, webview_id, request_id, type, data)|object|number|number|number|table|string|string A callback which receives info about finished requests taking the following parameters <dl> <dt>self</dt> <dd> The calling script</dd> <dt>webview_id</dt> <dd> The webview id</dd> <dt>request_id</dt> <dd> The request id</dd> <dt>type</dt> <dd> The type of the callback. Can be one of these:</dd> </dl> <ul> webview.CALLBACK_RESULT_URL_OK webview.CALLBACK_RESULT_URL_ERROR webview.CALLBACK_RESULT_EVAL_OK webview.CALLBACK_RESULT_EVAL_ERROR </ul> <dl> <dt>data</dt> <dd> A table holding the data. The table has these fields:</dd> </dl> <ul>  url: The url used in the webview.open() call. nil otherwise.  result: Holds the result of either: a failed url open, a successful eval request or a failed eval. nil otherwise </ul>
---@return number The id number of the webview
    function webview.create(callback) end
---Destroys an instance of a webview.
---@param webview_id number The webview id (returned by the webview.create() call)
    function webview.destroy(webview_id) end
---Evaluates java script within the context of the currently loaded page (if any).
---Once the request is done, the callback (registered in webview.create())
---is invoked. The callback will get the result in the data["result"] field.
---@param webview_id number The webview id
---@param code string The java script code to evaluate
---@return number The id number of the request
    function webview.eval(webview_id, code) end
---Returns the visibility state of the webview.
---@param webview_id number The webview id (returned by the webview.create() call)
---@return number Returns 0 if not visible, 1 if it is visible
    function webview.is_visible(webview_id) end
---Opens a web page in the webview, using an url. Once the request is done, the
---callback (registered in webview.create()) is invoked.
---@param webview_id number The webview id
---@param url string The url to open
---@param options table|boolean A table of options for the request. Currently it holds these options <dl> <dt>hidden</dt> <dd> If true, the webview will stay hidden (default=false)</dd> </dl>
---@return number The id number of the request
    function webview.open(webview_id, url, options) end
---Opens a web page in the webview, using html data. Once the request is done,
---the callback (registered in webview.create()) is invoked.
---@param webview_id number The webview id
---@param html string The html data to display
---@param options table A table of options for the request. See webview.open()
---@return number The id number of the request
    function webview.open_raw(webview_id, html, options) end
---Shows or hides a web view
---@param webview_id number The webview id (returned by the webview.create() call)
---@param visible number If 0, hides the webview. If non zero, shows the view
    function webview.set_visible(webview_id, visible) end
return webview