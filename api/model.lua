---Model API documentation
---Functions and messages for interacting with model components.
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
---@return id hash id of the game object
function model.get_go(url, bone_id) end
---Plays an animation on a model component with specified playback
---mode and parameters.
---
---An optional completion callback function can be provided that will be called when
---the animation has completed playing. If no function is provided,
---a model_animation_done <> message is sent to the script that started the animation.
---
--- The callback is not called (or message sent) if the animation is
---cancelled with model.cancel <>. The callback is called (or message sent) only for
---animations that play with the following playback modes:
---
---
--- * go.PLAYBACK_ONCE_FORWARD
---
--- * go.PLAYBACK_ONCE_BACKWARD
---
--- * go.PLAYBACK_ONCE_PINGPONG

---@param url string | hash | url the model for which to play the animation
---@param anim_id string | hash id of the animation to play
---@param playback constant playback mode of the animation
---@param play_properties table optional table with properties
---@param complete_function function(self, message_id, message, sender)) function to call when the animation has completed.
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