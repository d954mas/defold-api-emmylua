--Messaging API documentation
--Functions for passing messages and constructing URL objects.
---@class msg
local msg = {}
---Post a message to a receiving URL. The most common case is to send messages
---to a component. If the component part of the receiver is omitted, the message
---is broadcast to all components in the game object.
---The following receiver shorthands are available:
---<ul>
---"." the current game object
---"#" the current component
---</ul>
--- There is a 2 kilobyte limit to the message parameter table size.
---@param receiver string | url | hash | nil The receiver must be a string in URL-format, a URL object, a hashed string or nil.
---@param message_id string | hash The id must be a string or a hashed string.
---@param [message] table a lua table with message parameters to send.
    function msg.post(receiver, message_id, message) end
---This is equivalent to msg.url(nil) or msg.url("#"), which creates an url to the current
---script component.
    function msg.url() end
return msg