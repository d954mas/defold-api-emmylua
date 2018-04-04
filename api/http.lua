--HTTP API documentation
--Functions for performing HTTP and HTTPS requests.
---@class http
local http = {}
---Perform a HTTP/HTTPS request.
--- If no timeout value is passed, the configuration value "network.http_timeout" is used. If that is not set, the timeout value is 0 (which blocks indefinitely).
---@param url string target url
---@param method string HTTP/HTTPS method, e.g. "GET", "PUT", "POST" etc.
---@param callback function(self, id, response)|object|hash|table|number|string|table response callback function <dl> <dt>self</dt> <dd> The current object</dd> <dt>id</dt> <dd> Internal message identifier. Do not use!</dd> <dt>response</dt> <dd> The response data. Contains the fields:</dd> </dl> <ul>  status: the status of the response  response: the response data  headers: all the returned headers </ul>
---@param [headers] table optional table with custom headers
---@param [post_data] string optional data to send
---@param [options] table|number optional table with request parameters. Supported entries: <ul>  timeout: timeout in seconds </ul>
    function http.request(url, method, callback, headers, post_data, options) end
return http