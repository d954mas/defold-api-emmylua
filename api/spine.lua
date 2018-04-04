--Spine model API documentation
--Functions and messages for interacting with the 'Spine' 2D bone
--animation system.
---@class spine
local spine = {}
---Cancels all running animations on a specified spine model component.
---@param url string | hash | url the spine model for which to cancel the animation
    function spine.cancel(url) end
---Returns the id of the game object that corresponds to a specified skeleton bone.
---The returned game object can be used for parenting and transform queries.
---This function has complexity O(n), where n is the number of bones in the spine model skeleton.
---Game objects corresponding to a spine model skeleton bone can not be individually deleted.
---@param url string | hash | url the spine model to query
---@param bone_id string | hash id of the corresponding bone
---@return hash id of the game object
    function spine.get_go(url, bone_id) end
---Plays a specified animation on a spine model component with specified playback
---mode and parameters.
---An optional completion callback function can be provided that will be called when
---the animation has completed playing. If no function is provided,
---a <a href="#spine_animation_done">spine_animation_done</a> message is sent to the script that started the animation.
--- The callback is not called (or message sent) if the animation is
---cancelled with <a href="/ref/spine#spine.cancel">spine.cancel</a>. The callback is called (or message sent) only for
---animations that play with the following playback modes:
---<ul>
---go.PLAYBACK_ONCE_FORWARD
---go.PLAYBACK_ONCE_BACKWARD
---go.PLAYBACK_ONCE_PINGPONG
---</ul>
---@param url string | hash | url the spine model for which to play the animation
---@param anim_id string | hash id of the animation to play
---@param playback constant playback mode of the animation <ul> go.PLAYBACK_ONCE_FORWARD go.PLAYBACK_ONCE_BACKWARD go.PLAYBACK_ONCE_PINGPONG go.PLAYBACK_LOOP_FORWARD go.PLAYBACK_LOOP_BACKWARD go.PLAYBACK_LOOP_PINGPONG </ul>
---@param [play_properties] table|number|number|number optional table with properties: <dl> <dt>blend_duration</dt> <dd> duration of a linear blend between the current and new animation.</dd> <dt>offset</dt> <dd> the normalized initial value of the animation cursor when the animation starts playing.</dd> <dt>playback_rate</dt> <dd> the rate with which the animation will be played. Must be positive.</dd> </dl>
---@param [complete_function] function(self, message_id, message, sender))|object|hash|table|hash|constant|url function to call when the animation has completed. <dl> <dt>self</dt> <dd> The current object.</dd> <dt>message_id</dt> <dd> The name of the completion message, "spine_animation_done".</dd> <dt>message</dt> <dd> Information about the completion:</dd> </dl> <ul>  animation_id - the animation that was completed.  playback - the playback mode for the animation. </ul> <dl> <dt>sender</dt> <dd> The invoker of the callback: the spine model component.</dd> </dl>
    function spine.play_anim(url, anim_id, playback, play_properties, complete_function) end
---Resets a shader constant for a spine model component.
---The constant must be defined in the material assigned to the spine model.
---Resetting a constant through this function implies that the value defined in the material will be used.
---Which spine model to reset a constant for is identified by the URL.
---@param url string | hash | url the spine model that should have a constant reset
---@param constant string | hash name of the constant
    function spine.reset_constant(url, constant) end
---Sets a shader constant for a spine model component.
---The constant must be defined in the material assigned to the spine model.
---Setting a constant through this function will override the value set for that constant in the material.
---The value will be overridden until spine.reset_constant is called.
---Which spine model to set a constant for is identified by the URL.
---@param url string | hash | url the spine model that should have a constant set
---@param constant string | hash name of the constant
---@param value vector4 value of the constant
    function spine.set_constant(url, constant, value) end
---Sets a game object as target position of an inverse kinematic (IK) object. As the
---target game object's position is updated, the constraint object is updated with the
---new position.
---@param url string | hash | url the spine model containing the object
---@param ik_constraint_id string | hash id of the corresponding IK constraint object
---@param target_url string | hash | url target game object
    function spine.set_ik_target(url, ik_constraint_id, target_url) end
---Sets a static (vector3) target position of an inverse kinematic (IK) object.
---@param url string | hash | url the spine model containing the object
---@param ik_constraint_id string | hash id of the corresponding IK constraint object
---@param position vector3 target position
    function spine.set_ik_target_position(url, ik_constraint_id, position) end
return spine