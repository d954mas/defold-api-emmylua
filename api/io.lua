--Lua io standard library
--Documentation for the Lua io standard library.
--From <a href="https://www.lua.org/manual/5.1/">Lua 5.1 Reference Manual</a>
--by Roberto Ierusalimschy, Luiz Henrique de Figueiredo, Waldemar Celes.
--Copyright &copy; 2006-2012 Lua.org, PUC-Rio.
--Freely available under the terms of the <a href="https://www.lua.org/license.html">Lua license</a>.
---@class file:close
local file:close = {}
---Closes file.
---Note that files are automatically closed when
---their handles are garbage collected,
---but that takes an unpredictable amount of time to happen.
    function file:close() end
---@class file:flush
local file:flush = {}
---Saves any written data to file.
    function file:flush() end
---@class file:lines
local file:lines = {}
---Returns an iterator function that,
---each time it is called,
---returns a new line from the file.
---Therefore, the construction
---for line in file:lines() do body end
---
---
---
---will iterate over all lines of the file.
---(Unlike io.lines, this function does not close the file
---when the loop ends.)
    function file:lines() end
---@class file:read
local file:read = {}
---Reads the file file,
---according to the given formats, which specify what to read.
---For each format,
---the function returns a string (or a number) with the characters read,
---or  nil if it cannot read data with the specified format.
---When called without formats,
---it uses a default format that reads the entire next line
---(see below).
---The available formats are
---<dl>
---<dt>"*n"</dt>
---<dd>reads a number;
---this is the only format that returns a number instead of a string.</dd>
---<dt>"*a"</dt>
---<dd>reads the whole file, starting at the current position.
---On end of file, it returns the empty string.</dd>
---<dt>"*l"</dt>
---<dd>reads the next line (skipping the end of line),
---returning  nil on end of file.
---This is the default format.</dd>
---<dt><em>number</em></dt>
---<dd>reads a string with up to this number of characters,
---returning  nil on end of file.
---If number is zero,
---it reads nothing and returns an empty string,
---or  nil on end of file.</dd>
---</dl>
---@param ...
    function file:read(...) end
---@class file:seek
local file:seek = {}
---Sets and gets the file position,
---measured from the beginning of the file,
---to the position given by offset plus a base
---specified by the string whence, as follows:
---<dl>
---<dt>"set"</dt>
---<dd>base is position 0 (beginning of the file);</dd>
---<dt>"cur"</dt>
---<dd>base is current position;</dd>
---<dt>"end"</dt>
---<dd>base is end of file;</dd>
---</dl>
---In case of success, function seek returns the final file position,
---measured in bytes from the beginning of the file.
---If this function fails, it returns  nil,
---plus a string describing the error.
---The default value for whence is "cur",
---and for offset is 0.
---Therefore, the call file:seek() returns the current
---file position, without changing it;
---the call file:seek("set") sets the position to the
---beginning of the file (and returns 0);
---and the call file:seek("end") sets the position to the
---end of the file, and returns its size.
---@param [whence]
---@param [offset]
    function file:seek(whence, offset) end
---@class file:setvbuf
local file:setvbuf = {}
---Sets the buffering mode for an output file.
---There are three available modes:
---<dl>
---<dt>"no"</dt>
---<dd>no buffering; the result of any output operation appears immediately.</dd>
---<dt>"full"</dt>
---<dd>full buffering; output operation is performed only
---when the buffer is full (or when you explicitly flush the file
---).</dd>
---<dt>"line"</dt>
---<dd>line buffering; output is buffered until a newline is output
---or there is any input from some special files
---(such as a terminal device).</dd>
---</dl>
---For the last two cases, size
---specifies the size of the buffer, in bytes.
---The default is an appropriate size.
---@param mode
---@param [size]
    function file:setvbuf(mode, size) end
---@class file:write
local file:write = {}
---Writes the value of each of its arguments to
---the file.
---The arguments must be strings or numbers.
---To write other values,
---use tostring or string.format before write.
---@param ...
    function file:write(...) end
---@class io
local io = {}
---Equivalent to file:close().
---Without a file, closes the default output file.
---@param [file]
    function io.close(file) end
---Equivalent to file:flush over the default output file.
    function io.flush() end
---When called with a file name, it opens the named file (in text mode),
---and sets its handle as the default input file.
---When called with a file handle,
---it simply sets this file handle as the default input file.
---When called without parameters,
---it returns the current default input file.
---In case of errors this function raises the error,
---instead of returning an error code.
---@param [file]
    function io.input(file) end
---Opens the given file name in read mode
---and returns an iterator function that,
---each time it is called,
---returns a new line from the file.
---Therefore, the construction
---for line in io.lines(filename) do body end
---
---
---
---will iterate over all lines of the file.
---When the iterator function detects the end of file,
---it returns  nil (to finish the loop) and automatically closes the file.
---The call io.lines() (with no file name) is equivalent
---to io.input():lines();
---that is, it iterates over the lines of the default input file.
---In this case it does not close the file when the loop ends.
---@param [filename]
    function io.lines(filename) end
---This function opens a file,
---in the mode specified in the string mode.
---It returns a new file handle,
---or, in case of errors,  nil plus an error message.
---The mode string can be any of the following:
---<dl>
---<dt>"r"</dt>
---<dd>read mode (the default);</dd>
---<dt>"w"</dt>
---<dd>write mode;</dd>
---<dt>"a"</dt>
---<dd>append mode;</dd>
---<dt>"r+"</dt>
---<dd>update mode, all previous data is preserved;</dd>
---<dt>"w+"</dt>
---<dd>update mode, all previous data is erased;</dd>
---<dt>"a+"</dt>
---<dd>append update mode, previous data is preserved,
---  writing is only allowed at the end of file.</dd>
---</dl>
---The mode string can also have a 'b' at the end,
---which is needed in some systems to open the file in binary mode.
---This string is exactly what is used in the
---standard C function fopen.
---@param filename
---@param [mode]
    function io.open(filename, mode) end
---Similar to io.input, but operates over the default output file.
---@param [file]
    function io.output(file) end
---Starts program prog in a separated process and returns
---a file handle that you can use to read data from this program
---(if mode is "r", the default)
---or to write data to this program
---(if mode is "w").
---This function is system dependent and is not available
---on all platforms.
---@param prog
---@param [mode]
    function io.popen(prog, mode) end
---Equivalent to io.input():read.
---@param ...
    function io.read(...) end
---Returns a handle for a temporary file.
---This file is opened in update mode
---and it is automatically removed when the program ends.
    function io.tmpfile() end
---Checks whether obj is a valid file handle.
---Returns the string "file" if obj is an open file handle,
---"closed file" if obj is a closed file handle,
---or  nil if obj is not a file handle.
---@param obj
    function io.type(obj) end
---Equivalent to io.output():write.
---@param ...
    function io.write(...) end
return file:close