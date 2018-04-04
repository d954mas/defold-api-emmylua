--Profiler API documentation
--Functions for getting profiling data in runtime.
--More detailed profiling and debugging information can be found under the <a href="http://www.defold.com/manuals/debugging/">Debugging</a> section in the manuals.
---@class profiler
local profiler = {}
---Get the percent of CPU usage by the application, as reported by the OS.
--- This function is not available on  HTML5.
---For some platforms ( Android,  Linux and  Windows), this information is only available
---by default in the debug version of the engine. It can be enabled in release version as well
---by checking track_cpu under profiler in the game.project file.
---(This means that the engine will sample the CPU usage in intervalls during execution even in release mode.)
    function profiler.get_cpu_usage() end
---Get the amount of memory used (resident/working set) by the application in bytes, as reported by the OS.
--- This function is not available on  HTML5.
---The values are gathered from internal OS functions which correspond to the following;
---<table>
---<thead>
---<tr>
---<th>OS</th>
---<th>Value</th>
---</tr>
---</thead>
---<tbody>
---<tr>
---<td> iOS<br/> MacOS<br/><br/>Androd<br/> Linux</td>
---<td><a href="https://en.wikipedia.org/wiki/Resident_set_size">Resident memory</a></td>
---</tr>
---<tr>
---<td> Windows</td>
---<td><a href="https://en.wikipedia.org/wiki/Working_set">Working set</a></td>
---</tr>
---<tr>
---<td> HTML5</td>
---<td> Not available</td>
---</tr>
---</tbody>
---</table>
    function profiler.get_memory_usage() end
return profiler