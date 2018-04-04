--Inter-app communication API documentation
--Functions and constants for doing inter-app communication.
--  These API:s only exist on mobile platforms.
---@class iac
local iac = {}
    iac.TYPE_INVOCATION = nil
---Sets the listener function for inter-app communication events.
---@param listener function(self, payload, type)|object|table|constant listener callback function. Pass an empty function if you no longer wish to receive callbacks. <dl> <dt>self</dt> <dd>  The current object. </dd> <dt>payload</dt> <dd>  The iac payload. </dd> <dt>type</dt> <dd>  The type of iac, an iac.TYPE_<TYPE> enumeration. </dd> </dl>
    function iac.set_listener(listener) end
return iac