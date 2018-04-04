--LuaSocket API documentation
--<a href="https://github.com/diegonehab/luasocket">LuaSocket</a> is a Lua extension library that provides
--support for the TCP and UDP transport layers. Defold provides the "socket" namespace in
--runtime, which contain the core C functionality. Additional LuaSocket support modules for
--SMTP, HTTP, FTP etc are not part of the core included, but can be easily added to a project
--and used.
--Note the included helper module "socket.lua" in "builtins/scripts/socket.lua". Require this
--module to add some additional functions and shortcuts to the namespace:
--require "builtins.scripts.socket"
--
--
--
--LuaSocket is Copyright &copy; 2004-2007 Diego Nehab. All rights reserved.
--LuaSocket is free software, released under the MIT license (same license as the Lua core).
---@class client:close
local client:close = {}
---Closes the TCP object. The internal socket used by the object is closed and the local address to which the object was bound is made available to other applications. No further operations (except for further calls to the close method) are allowed on a closed socket.
--- It is important to close all used sockets once they are not needed, since, in many systems, each socket uses a file descriptor, which are limited system resources. Garbage-collected objects are automatically closed before destruction, though.
    function client:close() end
---@class client:dirty
local client:dirty = {}
---Check the read buffer status.
--- This is an internal method, any use is unlikely to be portable.
    function client:dirty() end
---@class client:getfd
local client:getfd = {}
---Returns the underlying socket descriptor or handle associated to the object.
--- This is an internal method, any use is unlikely to be portable.
    function client:getfd() end
---@class client:getoption
local client:getoption = {}
---Gets options for the TCP object. See <a href="#client:setoption">client:setoption</a> for description of the option names and values.
---@param option string the name of the option to get: <ul> "keepalive" "linger" "reuseaddr" "tcp-nodelay" </ul>
---@return any the option value, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function client:getoption(option) end
---@class client:getpeername
local client:getpeername = {}
---Returns information about the remote side of a connected client object.
--- It makes no sense to call this method on server objects.
    function client:getpeername() end
---@class client:getsockname
local client:getsockname = {}
---Returns the local address information associated to the object.
    function client:getsockname() end
---@class client:getstats
local client:getstats = {}
---Returns accounting information on the socket, useful for throttling of bandwidth.
    function client:getstats() end
---@class client:receive
local client:receive = {}
---Reads data from a client object, according to the specified read pattern. Patterns follow the Lua file I/O format, and the difference in performance between patterns is negligible.
---@param [pattern] string | number the read pattern that can be any of the following: <dl> <dt>"*a"</dt> <dd>reads from the socket until the connection is closed. No end-of-line translation is performed;</dd> <dt>"*l"</dt> <dd>reads a line of text from the socket. The line is terminated by a LF character (ASCII 10), optionally preceded by a CR character (ASCII 13). The CR and LF characters are not included in the returned line. In fact, all CR characters are ignored by the pattern. This is the default pattern;</dd> <dt>number</dt> <dd>causes the method to read a specified number of bytes from the socket.</dd> </dl>
---@param [prefix] string an optional string to be concatenated to the beginning of any received data before return.
---@return string the received pattern, or nil in case of error.
---@return string the error message, or nil if no error occurred. The error message can be the string "closed" in case the connection was closed before the transmission was completed or the string "timeout" in case there was a timeout during the operation.
---@return string a (possibly empty) string containing the partial that was received, or nil if no error occurred.
    function client:receive(pattern, prefix) end
---@class client:send
local client:send = {}
---Sends data through client object.
---The optional arguments i and j work exactly like the standard <a href="/ref/string#string.sub">string.sub</a> Lua function to allow the selection of a substring to be sent.
--- Output is not buffered. For small strings, it is always better to concatenate them in Lua (with the .. operator) and send the result in one call instead of calling the method several times.
---@param data string the string to be sent.
---@param [i] number optional starting index of the string.
---@param [j] number optional end index of string.
---@return number the index of the last byte within [i, j] that has been sent, or nil in case of error. Notice that, if i is 1 or absent, this is effectively the total number of bytes sent.
---@return string the error message, or nil if no error occurred. The error message can be "closed" in case the connection was closed before the transmission was completed or the string "timeout" in case there was a timeout during the operation.
---@return number in case of error, the index of the last byte within [i, j] that has been sent. You might want to try again from the byte following that. nil if no error occurred.
    function client:send(data, i, j) end
---@class client:setfd
local client:setfd = {}
---Sets the underling socket descriptor or handle associated to the object. The current one is simply replaced, not closed, and no other change to the object state is made
---@param handle number the descriptor or handle to set.
    function client:setfd(handle) end
---@class client:setoption
local client:setoption = {}
---Sets options for the TCP object. Options are only needed by low-level or time-critical applications. You should only modify an option if you are sure you need it.
---@param option string|boolean|number the name of the option to set. The value is provided in the value parameter: <dl> <dt>"keepalive"</dt> <dd>Setting this option to true enables the periodic transmission of messages on a connected socket. Should the connected party fail to respond to these messages, the connection is considered broken and processes using the socket are notified;</dd> <dt>"linger"</dt> <dd>Controls the action taken when unsent data are queued on a socket and a close is performed. The value is a table with the following keys:</dd> </dl> <ul>  on  timeout (seconds) </ul> If the 'on' field is set to true, the system will block the process on the close attempt until it is able to transmit the data or until timeout has passed. If 'on' is false and a close is issued, the system will process the close in a manner that allows the process to continue as quickly as possible. It is not advised to set this to anything other than zero; <dl> <dt>"reuseaddr"</dt> <dd>Setting this option indicates that the rules used in validating addresses supplied in a call to bind should allow reuse of local addresses;</dd> <dt>"tcp-nodelay"</dt> <dd>Setting this option to true disables the Nagle's algorithm for the connection;</dd> <dt>"ipv6-v6only"</dt> <dd>Setting this option to true restricts an inet6 socket to sending and receiving only IPv6 packets.</dd> </dl>
---@param [value] any the value to set for the specified option.
---@return number the value 1, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function client:setoption(option, value) end
---@class client:setstats
local client:setstats = {}
---Resets accounting information on the socket, useful for throttling of bandwidth.
---@param received number the new number of bytes received.
---@param sent number the new number of bytes sent.
---@param age number the new age in seconds.
---@return number the value 1 in case of success, or nil in case of error.
    function client:setstats(received, sent, age) end
---@class client:settimeout
local client:settimeout = {}
---Changes the timeout values for the object. By default, all I/O operations are blocking. That is, any call to the methods send, receive, and accept will block indefinitely, until the operation completes. The settimeout method defines a limit on the amount of time the I/O methods can block. When a timeout is set and the specified amount of time has elapsed, the affected methods give up and fail with an error code.
---There are two timeout modes and both can be used together for fine tuning.
--- Although timeout values have millisecond precision in LuaSocket, large blocks can cause I/O functions not to respect timeout values due to the time the library takes to transfer blocks to and from the OS and to and from the Lua interpreter. Also, function that accept host names and perform automatic name resolution might be blocked by the resolver for longer than the specified timeout value.
---@param value number the amount of time to wait, in seconds. The nil timeout value allows operations to block indefinitely. Negative timeout values have the same effect.
---@param [mode] string optional timeout mode to set: <dl> <dt>"b"</dt> <dd>block timeout. Specifies the upper limit on the amount of time LuaSocket can be blocked by the operating system while waiting for completion of any single I/O operation. This is the default mode;</dd> <dt>"t"</dt> <dd>total timeout. Specifies the upper limit on the amount of time LuaSocket can block a Lua script before returning from a call.</dd> </dl>
    function client:settimeout(value, mode) end
---@class client:shutdown
local client:shutdown = {}
---Shuts down part of a full-duplex connection.
---@param mode string which way of the connection should be shut down: <dl> <dt>"both"</dt> <dd>disallow further sends and receives on the object. This is the default mode;</dd> <dt>"send"</dt> <dd>disallow further sends on the object;</dd> <dt>"receive"</dt> <dd>disallow further receives on the object.</dd> </dl>
---@return number the value 1.
    function client:shutdown(mode) end
---@class connected:close
local connected:close = {}
---Closes a UDP object. The internal socket used by the object is closed and the local address to which the object was bound is made available to other applications. No further operations (except for further calls to the close method) are allowed on a closed socket.
--- It is important to close all used sockets once they are not needed, since, in many systems, each socket uses a file descriptor, which are limited system resources. Garbage-collected objects are automatically closed before destruction, though.
    function connected:close() end
---@class connected:getoption
local connected:getoption = {}
---Gets an option value from the UDP object. See <a href="#connected:setoption">connected:setoption</a> for description of the option names and values.
---@param option string the name of the option to get: <ul> "dontroute" "broadcast" "reuseaddr" "reuseport" "ip-multicast-loop" "ipv6-v6only" "ip-multicast-if" "ip-multicast-ttl" "ip-add-membership" "ip-drop-membership" </ul>
---@return any the option value, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function connected:getoption(option) end
---@class connected:getpeername
local connected:getpeername = {}
---Retrieves information about the peer associated with a connected UDP object.
--- It makes no sense to call this method on unconnected objects.
    function connected:getpeername() end
---@class connected:getsockname
local connected:getsockname = {}
---Returns the local address information associated to the object.
--- UDP sockets are not bound to any address until the setsockname or the sendto method is called for the first time (in which case it is bound to an ephemeral port and the wild-card address).
    function connected:getsockname() end
---@class connected:receive
local connected:receive = {}
---Receives a datagram from the UDP object. If the UDP object is connected, only datagrams coming from the peer are accepted. Otherwise, the returned datagram can come from any host.
---@param [size] number optional maximum size of the datagram to be retrieved. If there are more than size bytes available in the datagram, the excess bytes are discarded. If there are less then size bytes available in the current datagram, the available bytes are returned. If size is omitted, the maximum datagram size is used (which is currently limited by the implementation to 8192 bytes).
---@return string the received datagram, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function connected:receive(size) end
---@class connected:send
local connected:send = {}
---Sends a datagram to the UDP peer of a connected object.
--- In UDP, the send method never blocks and the only way it can fail is if the underlying transport layer refuses to send a message to the specified address (i.e. no interface accepts the address).
---@param datagram string a string with the datagram contents. The maximum datagram size for UDP is 64K minus IP layer overhead. However datagrams larger than the link layer packet size will be fragmented, which may deteriorate performance and/or reliability.
---@return number the value 1 on success, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function connected:send(datagram) end
---@class connected:setoption
local connected:setoption = {}
---Sets options for the UDP object. Options are only needed by low-level or time-critical applications. You should only modify an option if you are sure you need it.
---@param option string|string|string|string|string the name of the option to set. The value is provided in the value parameter: <dl> <dt>"dontroute"</dt> <dd>Indicates that outgoing messages should bypass the standard routing facilities. Receives a boolean value;</dd> <dt>"broadcast"</dt> <dd>Requests permission to send broadcast datagrams on the socket. Receives a boolean value;</dd> <dt>"reuseaddr"</dt> <dd>Indicates that the rules used in validating addresses supplied in a bind call should allow reuse of local addresses. Receives a boolean value;</dd> <dt>"reuseport"</dt> <dd>Allows completely duplicate bindings by multiple processes if they all set "reuseport" before binding the port. Receives a boolean value;</dd> <dt>"ip-multicast-loop"</dt> <dd>Specifies whether or not a copy of an outgoing multicast datagram is delivered to the sending host as long as it is a member of the multicast group. Receives a boolean value;</dd> <dt>"ipv6-v6only"</dt> <dd>Specifies whether to restrict inet6 sockets to sending and receiving only IPv6 packets. Receive a boolean value;</dd> <dt>"ip-multicast-if"</dt> <dd>Sets the interface over which outgoing multicast datagrams are sent. Receives an IP address;</dd> <dt>"ip-multicast-ttl"</dt> <dd>Sets the Time To Live in the IP header for outgoing multicast datagrams. Receives a number;</dd> </dl> "ip-add-membership": Joins the multicast group specified. Receives a table with fields: <ul>  multiaddr (IP address)  interface (IP address) </ul> <dl> <dt>"'ip-drop-membership"`</dt> <dd>Leaves the multicast group specified. Receives a table with fields:</dd> </dl> <ul>  multiaddr (IP address)  interface (IP address) </ul>
---@param [value] any the value to set for the specified option.
---@return number the value 1, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function connected:setoption(option, value) end
---@class connected:setpeername
local connected:setpeername = {}
---Changes the peer of a UDP object. This method turns an unconnected UDP object into a connected UDP object or vice versa.
---For connected objects, outgoing datagrams will be sent to the specified peer, and datagrams received from other peers will be discarded by the OS. Connected UDP objects must use the send and receive methods instead of sendto and receivefrom.
--- Since the address of the peer does not have to be passed to and from the OS, the use of connected UDP objects is recommended when the same peer is used for several transmissions and can result in up to 30% performance gains.
---@param "*" string if address is "*"" and the object is connected, the peer association is removed and the object becomes an unconnected object again.
---@return number the value 1 on success, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function connected:setpeername("*") end
---@class connected:settimeout
local connected:settimeout = {}
---Changes the timeout values for the object. By default, the receive and receivefrom  operations are blocking. That is, any call to the methods will block indefinitely, until data arrives. The settimeout function defines a limit on the amount of time the functions can block. When a timeout is set and the specified amount of time has elapsed, the affected methods give up and fail with an error code.
--- In UDP, the send and sendto methods never block (the datagram is just passed to the OS and the call returns immediately). Therefore, the settimeout method has no effect on them.
---@param value number the amount of time to wait, in seconds. The nil timeout value allows operations to block indefinitely. Negative timeout values have the same effect.
    function connected:settimeout(value) end
---@class master:bind
local master:bind = {}
---Binds a master object to address and port on the local host.
---@param address string an IP address or a host name. If address is "*", the system binds to all local interfaces using the INADDR_ANY constant.
---@param port number the port to commect to, in the range [0..64K). If port is 0, the system automatically chooses an ephemeral port.
---@return number the value 1, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function master:bind(address, port) end
---@class master:close
local master:close = {}
---Closes the TCP object. The internal socket used by the object is closed and the local address to which the object was bound is made available to other applications. No further operations (except for further calls to the close method) are allowed on a closed socket.
--- It is important to close all used sockets once they are not needed, since, in many systems, each socket uses a file descriptor, which are limited system resources. Garbage-collected objects are automatically closed before destruction, though.
    function master:close() end
---@class master:connect
local master:connect = {}
---Attempts to connect a master object to a remote host, transforming it into a client object. Client objects support methods send, receive, getsockname, getpeername, settimeout, and close.
---Note that the function socket.connect is available and is a shortcut for the creation of client sockets.
---@param address string an IP address or a host name. If address is "*", the system binds to all local interfaces using the INADDR_ANY constant.
---@param port number the port to commect to, in the range [0..64K). If port is 0, the system automatically chooses an ephemeral port.
---@return number the value 1, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function master:connect(address, port) end
---@class master:dirty
local master:dirty = {}
---Check the read buffer status.
--- This is an internal method, any use is unlikely to be portable.
    function master:dirty() end
---@class master:getfd
local master:getfd = {}
---Returns the underlying socket descriptor or handle associated to the object.
--- This is an internal method, any use is unlikely to be portable.
    function master:getfd() end
---@class master:getsockname
local master:getsockname = {}
---Returns the local address information associated to the object.
    function master:getsockname() end
---@class master:getstats
local master:getstats = {}
---Returns accounting information on the socket, useful for throttling of bandwidth.
    function master:getstats() end
---@class master:listen
local master:listen = {}
---Specifies the socket is willing to receive connections, transforming the object into a server object. Server objects support the accept, getsockname, setoption, settimeout, and close methods.
---@param backlog number the number of client connections that can be queued waiting for service. If the queue is full and another client attempts connection, the connection is refused.
---@return number the value 1, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function master:listen(backlog) end
---@class master:setfd
local master:setfd = {}
---Sets the underling socket descriptor or handle associated to the object. The current one is simply replaced, not closed, and no other change to the object state is made
---@param handle number the descriptor or handle to set.
    function master:setfd(handle) end
---@class master:setstats
local master:setstats = {}
---Resets accounting information on the socket, useful for throttling of bandwidth.
---@param received number the new number of bytes received.
---@param sent number the new number of bytes sent.
---@param age number the new age in seconds.
---@return number the value 1 in case of success, or nil in case of error.
    function master:setstats(received, sent, age) end
---@class master:settimeout
local master:settimeout = {}
---Changes the timeout values for the object. By default, all I/O operations are blocking. That is, any call to the methods send, receive, and accept will block indefinitely, until the operation completes. The settimeout method defines a limit on the amount of time the I/O methods can block. When a timeout is set and the specified amount of time has elapsed, the affected methods give up and fail with an error code.
---There are two timeout modes and both can be used together for fine tuning.
--- Although timeout values have millisecond precision in LuaSocket, large blocks can cause I/O functions not to respect timeout values due to the time the library takes to transfer blocks to and from the OS and to and from the Lua interpreter. Also, function that accept host names and perform automatic name resolution might be blocked by the resolver for longer than the specified timeout value.
---@param value number the amount of time to wait, in seconds. The nil timeout value allows operations to block indefinitely. Negative timeout values have the same effect.
---@param [mode] string optional timeout mode to set: <dl> <dt>"b"</dt> <dd>block timeout. Specifies the upper limit on the amount of time LuaSocket can be blocked by the operating system while waiting for completion of any single I/O operation. This is the default mode;</dd> <dt>"t"</dt> <dd>total timeout. Specifies the upper limit on the amount of time LuaSocket can block a Lua script before returning from a call.</dd> </dl>
    function master:settimeout(value, mode) end
---@class server:accept
local server:accept = {}
---Waits for a remote connection on the server object and returns a client object representing that connection.
--- Calling socket.select with a server object in the recvt parameter before a call to accept does not guarantee accept will return immediately. Use the settimeout method or accept might block until another client shows up.
    function server:accept() end
---@class server:close
local server:close = {}
---Closes the TCP object. The internal socket used by the object is closed and the local address to which the object was bound is made available to other applications. No further operations (except for further calls to the close method) are allowed on a closed socket.
--- It is important to close all used sockets once they are not needed, since, in many systems, each socket uses a file descriptor, which are limited system resources. Garbage-collected objects are automatically closed before destruction, though.
    function server:close() end
---@class server:dirty
local server:dirty = {}
---Check the read buffer status.
--- This is an internal method, any use is unlikely to be portable.
    function server:dirty() end
---@class server:getfd
local server:getfd = {}
---Returns the underlying socket descriptor or handle associated to the object.
--- This is an internal method, any use is unlikely to be portable.
    function server:getfd() end
---@class server:getoption
local server:getoption = {}
---Gets options for the TCP object. See <a href="#server:setoption">server:setoption</a> for description of the option names and values.
---@param option string the name of the option to get: <ul> "keepalive" "linger" "reuseaddr" "tcp-nodelay" </ul>
---@return any the option value, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function server:getoption(option) end
---@class server:getsockname
local server:getsockname = {}
---Returns the local address information associated to the object.
    function server:getsockname() end
---@class server:getstats
local server:getstats = {}
---Returns accounting information on the socket, useful for throttling of bandwidth.
    function server:getstats() end
---@class server:setfd
local server:setfd = {}
---Sets the underling socket descriptor or handle associated to the object. The current one is simply replaced, not closed, and no other change to the object state is made
---@param handle number the descriptor or handle to set.
    function server:setfd(handle) end
---@class server:setoption
local server:setoption = {}
---Sets options for the TCP object. Options are only needed by low-level or time-critical applications. You should only modify an option if you are sure you need it.
---@param option string|boolean|number the name of the option to set. The value is provided in the value parameter: <dl> <dt>"keepalive"</dt> <dd>Setting this option to true enables the periodic transmission of messages on a connected socket. Should the connected party fail to respond to these messages, the connection is considered broken and processes using the socket are notified;</dd> <dt>"linger"</dt> <dd>Controls the action taken when unsent data are queued on a socket and a close is performed. The value is a table with the following keys:</dd> </dl> <ul>  on  timeout (seconds) </ul> If the 'on' field is set to true, the system will block the process on the close attempt until it is able to transmit the data or until timeout has passed. If 'on' is false and a close is issued, the system will process the close in a manner that allows the process to continue as quickly as possible. It is not advised to set this to anything other than zero; <dl> <dt>"reuseaddr"</dt> <dd>Setting this option indicates that the rules used in validating addresses supplied in a call to bind should allow reuse of local addresses;</dd> <dt>"tcp-nodelay"</dt> <dd>Setting this option to true disables the Nagle's algorithm for the connection;</dd> <dt>"ipv6-v6only"</dt> <dd>Setting this option to true restricts an inet6 socket to sending and receiving only IPv6 packets.</dd> </dl>
---@param [value] any the value to set for the specified option.
---@return number the value 1, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function server:setoption(option, value) end
---@class server:setstats
local server:setstats = {}
---Resets accounting information on the socket, useful for throttling of bandwidth.
---@param received number the new number of bytes received.
---@param sent number the new number of bytes sent.
---@param age number the new age in seconds.
---@return number the value 1 in case of success, or nil in case of error.
    function server:setstats(received, sent, age) end
---@class server:settimeout
local server:settimeout = {}
---Changes the timeout values for the object. By default, all I/O operations are blocking. That is, any call to the methods send, receive, and accept will block indefinitely, until the operation completes. The settimeout method defines a limit on the amount of time the I/O methods can block. When a timeout is set and the specified amount of time has elapsed, the affected methods give up and fail with an error code.
---There are two timeout modes and both can be used together for fine tuning.
--- Although timeout values have millisecond precision in LuaSocket, large blocks can cause I/O functions not to respect timeout values due to the time the library takes to transfer blocks to and from the OS and to and from the Lua interpreter. Also, function that accept host names and perform automatic name resolution might be blocked by the resolver for longer than the specified timeout value.
---@param value number the amount of time to wait, in seconds. The nil timeout value allows operations to block indefinitely. Negative timeout values have the same effect.
---@param [mode] string optional timeout mode to set: <dl> <dt>"b"</dt> <dd>block timeout. Specifies the upper limit on the amount of time LuaSocket can be blocked by the operating system while waiting for completion of any single I/O operation. This is the default mode;</dd> <dt>"t"</dt> <dd>total timeout. Specifies the upper limit on the amount of time LuaSocket can block a Lua script before returning from a call.</dd> </dl>
    function server:settimeout(value, mode) end
---@class socket
local socket = {}
    socket._SETSIZE = nil
    socket._VERSION = nil
---This function is a shortcut that creates and returns a TCP client object connected to a remote
---address at a given port. Optionally, the user can also specify the local address and port to
---bind (locaddr and locport), or restrict the socket family to "inet" or "inet6".
---Without specifying family to connect, whether a tcp or tcp6 connection is created depends on
---your system configuration.
---@param address string the address to connect to.
---@param port number the port to connect to.
---@param [locaddr] string optional local address to bind to.
---@param [locport] number optional local port to bind to.
---@param [family] string optional socket family to use, "inet" or "inet6".
---@return client a new IPv6 TCP client object, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function socket.connect(address, port, locaddr, locport, family) end
---This function converts a host name to IPv4 or IPv6 address.
---The supplied address can be an IPv4 or IPv6 address or host name.
---The function returns a table with all information returned by the resolver:
---{
--- [1] = {
---    family = family-name-1,
---    addr = address-1
---  },
---  ...
---  [n] = {
---    family = family-name-n,
---    addr = address-n
---  }
---}
---
---
---
---Here, family contains the string "inet" for IPv4 addresses, and "inet6" for IPv6 addresses.
---In case of error, the function returns nil followed by an error message.
---@param address string a hostname or an IPv4 or IPv6 address.
---@return table a table with all information returned by the resolver, or if an error occurs, nil.
---@return string the error message, or nil if no error occurred.
    function socket.dns.getaddrinfo(address) end
---Returns the standard host name for the machine as a string.
    function socket.dns.gethostname() end
---This function converts an address to host name.
---The supplied address can be an IPv4 or IPv6 address or host name.
---The function returns a table with all information returned by the resolver:
---{
---  [1] = host-name-1,
---  ...
---  [n] = host-name-n,
---}
---@param address string a hostname or an IPv4 or IPv6 address.
---@return table a table with all information returned by the resolver, or if an error occurs, nil.
---@return string the error message, or nil if no error occurred.
    function socket.dns.getnameinfo(address) end
---This function converts from an IPv4 address to host name.
---The address can be an IPv4 address or a host name.
---@param address string an IPv4 address or host name.
---@return string the canonic host name of the given address, or nil in case of an error.
---@return table | string a table with all information returned by the resolver, or if an error occurs, the error message string.
    function socket.dns.tohostname(address) end
---This function converts a host name to IPv4 address.
---The address can be an IP address or a host name.
---@param address string a hostname or an IP address.
---@return string the first IP address found for the hostname, or nil in case of an error.
---@return table | string a table with all information returned by the resolver, or if an error occurs, the error message string.
    function socket.dns.toip(address) end
---Returns the time in seconds, relative to the system epoch (Unix epoch time since January 1, 1970 (UTC) or Windows file time since January 1, 1601 (UTC)).
---You should use the values returned by this function for relative measurements only.
    function socket.gettime() end
---This function creates and returns a clean try function that allows for cleanup before the exception is raised.
---The finalizer function will be called in protected mode (see <a href="#protect">protect</a>).
---@param finalizer function() a function that will be called before the try throws the exception.
---@return function the customized try function.
    function socket.newtry(finalizer) end
---Converts a function that throws exceptions into a safe function. This function only catches exceptions thrown by try functions. It does not catch normal Lua errors.
--- Beware that if your function performs some illegal operation that raises an error, the protected function will catch the error and return it as a string. This is because try functions uses errors as the mechanism to throw exceptions.
---@param func function a function that calls a try function (or assert, or error) to throw exceptions.
---@return function(function()) an equivalent function that instead of throwing exceptions, returns nil followed by an error message.
    function socket.protect(func) end
---The function returns a list with the sockets ready for reading, a list with the sockets ready for writing and an error message. The error message is "timeout" if a timeout condition was met and nil otherwise. The returned tables are doubly keyed both by integers and also by the sockets themselves, to simplify the test if a specific socket has changed status.
---Recvt and sendt parameters can be empty tables or nil. Non-socket values (or values with non-numeric indices) in these arrays will be silently ignored.
---The returned tables are doubly keyed both by integers and also by the sockets themselves, to simplify the test if a specific socket has changed status.
--- This function can monitor a limited number of sockets, as defined by the constant socket._SETSIZE. This number may be as high as 1024 or as low as 64 by default, depending on the system. It is usually possible to change this at compile time. Invoking select with a larger number of sockets will raise an error.
--- A known bug in WinSock causes select to fail on non-blocking TCP sockets. The function may return a socket as writable even though the socket is not ready for sending.
--- Calling select with a server socket in the receive parameter before a call to accept does not guarantee accept will return immediately. Use the settimeout method or accept might block forever.
--- If you close a socket and pass it to select, it will be ignored.
---(Using select with non-socket objects: Any object that implements getfd and dirty can be used with select, allowing objects from other libraries to be used within a socket.select driven loop.)
---@param recvt table array with the sockets to test for characters available for reading.
---@param sendt table array with sockets that are watched to see if it is OK to immediately write on them.
---@param [timeout] number the maximum amount of time (in seconds) to wait for a change in status. Nil, negative or omitted timeout value allows the function to block indefinitely.
---@return table a list with the sockets ready for reading.
---@return table a list with the sockets ready for writing.
---@return string an error message. "timeout" if a timeout condition was met, otherwise nil.
    function socket.select(recvt, sendt, timeout) end
---This function drops a number of arguments and returns the remaining.
---It is useful to avoid creation of dummy variables:
---D is the number of arguments to drop. Ret<sub>1</sub> to ret<sub>N</sub> are the arguments.
---The function returns ret<sub>D+1</sub> to ret<sub>N</sub>.
---@param d number the number of arguments to drop.
---@param [ret1] any argument 1.
---@param [ret2] any argument 2.
---@param [retN] any argument N.
---@return any argument D+1.
---@return any argument D+2.
---@return any argument N.
    function socket.skip(d, ret1, ret2, retN) end
---Freezes the program execution during a given amount of time.
---@param time number the number of seconds to sleep for.
    function socket.sleep(time) end
---Creates and returns an IPv4 TCP master object. A master object can be transformed into a server object with the method listen (after a call to bind) or into a client object with the method connect. The only other method supported by a master object is the close method.
    function socket.tcp() end
---Creates and returns an IPv6 TCP master object. A master object can be transformed into a server object with the method listen (after a call to bind) or into a client object with the method connect. The only other method supported by a master object is the close method.
---Note: The TCP object returned will have the option "ipv6-v6only" set to true.
    function socket.tcp6() end
---Creates and returns an unconnected IPv4 UDP object. Unconnected objects support the sendto, receive, receivefrom, getoption, getsockname, setoption, settimeout, setpeername, setsockname, and close methods. The setpeername method is used to connect the object.
    function socket.udp() end
---Creates and returns an unconnected IPv6 UDP object. Unconnected objects support the sendto, receive, receivefrom, getoption, getsockname, setoption, settimeout, setpeername, setsockname, and close methods. The setpeername method is used to connect the object.
---Note: The UDP object returned will have the option "ipv6-v6only" set to true.
    function socket.udp6() end
---@class unconnected:close
local unconnected:close = {}
---Closes a UDP object. The internal socket used by the object is closed and the local address to which the object was bound is made available to other applications. No further operations (except for further calls to the close method) are allowed on a closed socket.
--- It is important to close all used sockets once they are not needed, since, in many systems, each socket uses a file descriptor, which are limited system resources. Garbage-collected objects are automatically closed before destruction, though.
    function unconnected:close() end
---@class unconnected:getoption
local unconnected:getoption = {}
---Gets an option value from the UDP object. See <a href="#unconnected:setoption">unconnected:setoption</a> for description of the option names and values.
---@param option string the name of the option to get: <ul> "dontroute" "broadcast" "reuseaddr" "reuseport" "ip-multicast-loop" "ipv6-v6only" "ip-multicast-if" "ip-multicast-ttl" "ip-add-membership" "ip-drop-membership" </ul>
---@return any the option value, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function unconnected:getoption(option) end
---@class unconnected:getsockname
local unconnected:getsockname = {}
---Returns the local address information associated to the object.
--- UDP sockets are not bound to any address until the setsockname or the sendto method is called for the first time (in which case it is bound to an ephemeral port and the wild-card address).
    function unconnected:getsockname() end
---@class unconnected:receive
local unconnected:receive = {}
---Receives a datagram from the UDP object. If the UDP object is connected, only datagrams coming from the peer are accepted. Otherwise, the returned datagram can come from any host.
---@param [size] number optional maximum size of the datagram to be retrieved. If there are more than size bytes available in the datagram, the excess bytes are discarded. If there are less then size bytes available in the current datagram, the available bytes are returned. If size is omitted, the maximum datagram size is used (which is currently limited by the implementation to 8192 bytes).
---@return string the received datagram, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function unconnected:receive(size) end
---@class unconnected:receivefrom
local unconnected:receivefrom = {}
---Works exactly as the receive method, except it returns the IP address and port as extra return values (and is therefore slightly less efficient).
---@param [size] number optional maximum size of the datagram to be retrieved.
---@return string the received datagram, or nil in case of error.
---@return string the IP address, or the error message in case of error.
---@return number the port number, or nil in case of error.
    function unconnected:receivefrom(size) end
---@class unconnected:sendto
local unconnected:sendto = {}
---Sends a datagram to the specified IP address and port number.
--- In UDP, the send method never blocks and the only way it can fail is if the underlying transport layer refuses to send a message to the specified address (i.e. no interface accepts the address).
---@param datagram string a string with the datagram contents. The maximum datagram size for UDP is 64K minus IP layer overhead. However datagrams larger than the link layer packet size will be fragmented, which may deteriorate performance and/or reliability.
---@param ip string the IP address of the recipient. Host names are not allowed for performance reasons.
---@param port number the port number at the recipient.
---@return number the value 1 on success, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function unconnected:sendto(datagram, ip, port) end
---@class unconnected:setoption
local unconnected:setoption = {}
---Sets options for the UDP object. Options are only needed by low-level or time-critical applications. You should only modify an option if you are sure you need it.
---@param option string|string|string|string|string the name of the option to set. The value is provided in the value parameter: <dl> <dt>"dontroute"</dt> <dd>Indicates that outgoing messages should bypass the standard routing facilities. Receives a boolean value;</dd> <dt>"broadcast"</dt> <dd>Requests permission to send broadcast datagrams on the socket. Receives a boolean value;</dd> <dt>"reuseaddr"</dt> <dd>Indicates that the rules used in validating addresses supplied in a bind call should allow reuse of local addresses. Receives a boolean value;</dd> <dt>"reuseport"</dt> <dd>Allows completely duplicate bindings by multiple processes if they all set "reuseport" before binding the port. Receives a boolean value;</dd> <dt>"ip-multicast-loop"</dt> <dd>Specifies whether or not a copy of an outgoing multicast datagram is delivered to the sending host as long as it is a member of the multicast group. Receives a boolean value;</dd> <dt>"ipv6-v6only"</dt> <dd>Specifies whether to restrict inet6 sockets to sending and receiving only IPv6 packets. Receive a boolean value;</dd> <dt>"ip-multicast-if"</dt> <dd>Sets the interface over which outgoing multicast datagrams are sent. Receives an IP address;</dd> <dt>"ip-multicast-ttl"</dt> <dd>Sets the Time To Live in the IP header for outgoing multicast datagrams. Receives a number;</dd> </dl> "ip-add-membership": Joins the multicast group specified. Receives a table with fields: <ul>  multiaddr (IP address)  interface (IP address) </ul> <dl> <dt>"'ip-drop-membership"`</dt> <dd>Leaves the multicast group specified. Receives a table with fields:</dd> </dl> <ul>  multiaddr (IP address)  interface (IP address) </ul>
---@param [value] any the value to set for the specified option.
---@return number the value 1, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function unconnected:setoption(option, value) end
---@class unconnected:setpeername
local unconnected:setpeername = {}
---Changes the peer of a UDP object. This method turns an unconnected UDP object into a connected UDP object or vice versa.
---For connected objects, outgoing datagrams will be sent to the specified peer, and datagrams received from other peers will be discarded by the OS. Connected UDP objects must use the send and receive methods instead of sendto and receivefrom.
--- Since the address of the peer does not have to be passed to and from the OS, the use of connected UDP objects is recommended when the same peer is used for several transmissions and can result in up to 30% performance gains.
---@param address string an IP address or a host name.
---@param port number the port number.
---@return number the value 1 on success, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function unconnected:setpeername(address, port) end
---@class unconnected:setsockname
local unconnected:setsockname = {}
---Binds the UDP object to a local address.
--- This method can only be called before any datagram is sent through the UDP object, and only once. Otherwise, the system automatically binds the object to all local interfaces and chooses an ephemeral port as soon as the first datagram is sent. After the local address is set, either automatically by the system or explicitly by setsockname, it cannot be changed.
---@param address string an IP address or a host name. If address is "*" the system binds to all local interfaces using the constant INADDR_ANY.
---@param port number the port number. If port is 0, the system chooses an ephemeral port.
---@return number the value 1 on success, or nil in case of error.
---@return string the error message, or nil if no error occurred.
    function unconnected:setsockname(address, port) end
---@class unconnected:settimeout
local unconnected:settimeout = {}
---Changes the timeout values for the object. By default, the receive and receivefrom  operations are blocking. That is, any call to the methods will block indefinitely, until data arrives. The settimeout function defines a limit on the amount of time the functions can block. When a timeout is set and the specified amount of time has elapsed, the affected methods give up and fail with an error code.
--- In UDP, the send and sendto methods never block (the datagram is just passed to the OS and the call returns immediately). Therefore, the settimeout method has no effect on them.
---@param value number the amount of time to wait, in seconds. The nil timeout value allows operations to block indefinitely. Negative timeout values have the same effect.
    function unconnected:settimeout(value) end
return client:close