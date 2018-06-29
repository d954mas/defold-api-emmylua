---Inter-app communication API documentation
---Functions and constants for doing inter-app communication.
---
---  These API:s only exist on mobile platforms.
---@class iac
iac = {}
---iac type
iac.TYPE_INVOCATION = nil
---Sets the listener function for inter-app communication events.
---@param listener function(self, payload, type) listener callback function. Pass an empty function if you no longer wish to receive callbacks.
function iac.set_listener(listener) end

return iac