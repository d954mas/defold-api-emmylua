---Sprite API documentation
---Functions, messages and properties used to manipulate sprite components.
---@class sprite
sprite = {}
---Play an animation on a sprite component from its tile set
---
---An optional completion callback function can be provided that will be called when
---the animation has completed playing. If no function is provided,
---a animation_done <> message is sent to the script that started the animation.
---@param url string | hash | url the sprite that should play the animation
---@param id id hash name hash of the animation to play
---@param complete_function function(self, message_id, message, sender)) function to call when the animation has completed.
function sprite.play_flipbook(url, id, complete_function) end
---Resets a shader constant for a sprite component.
---The constant must be defined in the material assigned to the sprite.
---Resetting a constant through this function implies that the value defined in the material will be used.
---Which sprite to reset a constant for is identified by the URL.
---@param url string | hash | url the sprite that should have a constant reset
---@param constant string | hash name of the constant
function sprite.reset_constant(url, constant) end
---Sets a shader constant for a sprite component.
---The constant must be defined in the material assigned to the sprite.
---Setting a constant through this function will override the value set for that constant in the material.
---The value will be overridden until sprite.reset_constant is called.
---Which sprite to set a constant for is identified by the URL.
---@param url string | hash | url the sprite that should have a constant set
---@param constant string | hash name of the constant
---@param value vector4 of the constant
function sprite.set_constant(url, constant, value) end
---Sets horizontal flipping of the provided sprite's animations.
---The sprite is identified by its URL.
---If the currently playing animation is flipped by default, flipping it again will make it appear like the original texture.
---@param url string | hash | url the sprite that should flip its animations
---@param flip boolean 
function sprite.set_hflip(url, flip) end
---Sets vertical flipping of the provided sprite's animations.
---The sprite is identified by its URL.
---If the currently playing animation is flipped by default, flipping it again will make it appear like the original texture.
---@param url string | hash | url the sprite that should flip its animations
---@param flip boolean 
function sprite.set_vflip(url, flip) end

return sprite