---Collision object physics API documentation
---Functions and messages for collision object physics interaction
---with other objects (collisions and ray-casting) and control of
---physical behaviors.
---@class physics
physics = {}
---Ray casts are used to test for intersections against collision objects in the physics world.
---Collision objects of types kinematic, dynamic and static are tested against. Trigger objects
---do not intersect with ray casts.
---Which collision objects to hit is filtered by their collision groups and can be configured
---through groups.
---The actual ray cast will be performed during the physics-update.
---@param from vector3 the world position of the start of the ray
---@param to vector3 the world position of the end of the ray
---@param groups table a lua table containing the hashed groups for which to test collisions against
---@return table It returns a table. If asynchronous it returns nil. See ray_cast_response for details on the returned values.
function physics.raycast(from, to, groups) end
---Ray casts are used to test for intersections against collision objects in the physics world.
---Collision objects of types kinematic, dynamic and static are tested against. Trigger objects
---do not intersect with ray casts.
---Which collision objects to hit is filtered by their collision groups and can be configured
---through groups.
---The actual ray cast will be performed during the physics-update.
---
---
--- * If an object is hit, the result will be reported via a ray_cast_response message.
---
--- * If there is no object hit, the result will be reported via a ray_cast_missed message.

---@param from vector3 the world position of the start of the ray
---@param to vector3 the world position of the end of the ray
---@param groups table a lua table containing the hashed groups for which to test collisions against
---@param request_id number a number between [0,-255]. It will be sent back in the response for identification, 0 by default
function physics.raycast_async(from, to, groups, request_id) end



return physics