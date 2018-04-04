--Model API documentation
--Functions and messages for interacting with model components.
---@class model
local model = {}
---Cancels all animation on a model component.
---@param url string | hash | url the model for which to cancel the animation
    function model.cancel(url) end
---Gets the id of the game object that corresponds to a model skeleton bone.
---The returned game object can be used for parenting and transform queries.
---This function has complexity O(n), where n is the number of bones in the model skeleton.
---Game objects corresponding to a model skeleton bone can not be individually deleted.
---@param url string | hash | url the model to query
---@param bone_id string | hash id of the corresponding bone
---@return hash id of the game object
    function model.get_go(url, bone_id) end
---Plays an animation on a model component with specified playback
---mode and parameters.
---An optional completion callback function can be provided that will be called when
---the animation has completed playing. If no function is provided,
---a <a href="#model_animation_done">model_animation_done</a> message is sent to the script that started the animation.
--- The callback is not called (or message sent) if the animation is
---cancelled with <a href="/ref/model#model.cancel">model.cancel</a>. The callback is called (or message sent) only for
---animations that play with the following playback modes:
---<ul>
---go.PLAYBACK_ONCE_FORWARD
---go.PLAYBACK_ONCE_BACKWARD
---go.PLAYBACK_ONCE_PINGPONG
---</ul>
---@param url string | hash | url the model for which to play the animation
---@param anim_id string | hash id of the animation to play
---@param playback constant playback mode of the animation <ul> go.PLAYBACK_ONCE_FORWARD go.PLAYBACK_ONCE_BACKWARD go.PLAYBACK_ONCE_PINGPONG go.PLAYBACK_LOOP_FORWARD go.PLAYBACK_LOOP_BACKWARD go.PLAYBACK_LOOP_PINGPONG </ul>
---@param [play_properties] table|number|number|number optional table with properties Play properties table: <dl> <dt>blend_duration</dt> <dd> Duration of a linear blend between the current and new animation.</dd> <dt>offset</dt> <dd> The normalized initial value of the animation cursor when the animation starts playing.</dd> <dt>playback_rate</dt> <dd> The rate with which the animation will be played. Must be positive.</dd> </dl>
---@param [complete_function] function(self, message_id, message, sender))|object|hash|table|hash|constant|url function to call when the animation has completed. <dl> <dt>self</dt> <dd> The current object.</dd> <dt>message_id</dt> <dd> The name of the completion message, "model_animation_done".</dd> <dt>message</dt> <dd> Information about the completion:</dd> </dl> <ul>  animation_id - the animation that was completed.  playback - the playback mode for the animation. </ul> <dl> <dt>sender</dt> <dd> The invoker of the callback: the model component.</dd> </dl>
    function model.play_anim(url, anim_id, playback, play_properties, complete_function) end
---Resets a shader constant for a model component.
---The constant must be defined in the material assigned to the model.
---Resetting a constant through this function implies that the value defined in the material will be used.
---Which model to reset a constant for is identified by the URL.
---@param url string | hash | url the model that should have a constant reset.
---@param constant string | hash name of the constant.
    function model.reset_constant(url, constant) end
---Sets a shader constant for a model component.
---The constant must be defined in the material assigned to the model.
---Setting a constant through this function will override the value set for that constant in the material.
---The value will be overridden until model.reset_constant is called.
---Which model to set a constant for is identified by the URL.
---@param url string | hash | url the model that should have a constant set
---@param constant string | hash name of the constant
---@param value vector4 value of the constant
    function model.set_constant(url, constant, value) end
return model