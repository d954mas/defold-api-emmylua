--Game object API documentation
--Functions, core hooks, messages and constants for manipulation of
--game objects. The "go" namespace is accessible from game object script
--files.
---@class final
local final = {}
---This is a callback-function, which is called by the engine when a script component is finalized (destroyed). It can
---be used to e.g. take some last action, report the finalization to other game object instances, delete spawned objects
---or release user input focus (see <a href="#release_input_focus">release_input_focus</a>).
---@param self object reference to the script state to be used for storing data
    function final(self) end
---@class go
local go = {}
    go.EASING_INBACK = nil
    go.EASING_INBOUNCE = nil
    go.EASING_INCIRC = nil
    go.EASING_INCUBIC = nil
    go.EASING_INELASTIC = nil
    go.EASING_INEXPO = nil
    go.EASING_INOUTBACK = nil
    go.EASING_INOUTBOUNCE = nil
    go.EASING_INOUTCIRC = nil
    go.EASING_INOUTCUBIC = nil
    go.EASING_INOUTELASTIC = nil
    go.EASING_INOUTEXPO = nil
    go.EASING_INOUTQUAD = nil
    go.EASING_INOUTQUART = nil
    go.EASING_INOUTQUINT = nil
    go.EASING_INOUTSINE = nil
    go.EASING_INQUAD = nil
    go.EASING_INQUART = nil
    go.EASING_INQUINT = nil
    go.EASING_INSINE = nil
    go.EASING_LINEAR = nil
    go.EASING_OUTBACK = nil
    go.EASING_OUTBOUNCE = nil
    go.EASING_OUTCIRC = nil
    go.EASING_OUTCUBIC = nil
    go.EASING_OUTELASTIC = nil
    go.EASING_OUTEXPO = nil
    go.EASING_OUTINBACK = nil
    go.EASING_OUTINBOUNCE = nil
    go.EASING_OUTINCIRC = nil
    go.EASING_OUTINCUBIC = nil
    go.EASING_OUTINELASTIC = nil
    go.EASING_OUTINEXPO = nil
    go.EASING_OUTINQUAD = nil
    go.EASING_OUTINQUART = nil
    go.EASING_OUTINQUINT = nil
    go.EASING_OUTINSINE = nil
    go.EASING_OUTQUAD = nil
    go.EASING_OUTQUART = nil
    go.EASING_OUTQUINT = nil
    go.EASING_OUTSINE = nil
    go.PLAYBACK_LOOP_BACKWARD = nil
    go.PLAYBACK_LOOP_FORWARD = nil
    go.PLAYBACK_LOOP_PINGPONG = nil
    go.PLAYBACK_NONE = nil
    go.PLAYBACK_ONCE_BACKWARD = nil
    go.PLAYBACK_ONCE_FORWARD = nil
    go.PLAYBACK_ONCE_PINGPONG = nil
---This is only supported for numerical properties. If the node property is already being
---animated, that animation will be canceled and replaced by the new one.
---If a complete_function (lua function) is specified, that function will be called when the animation has completed.
---By starting a new animation in that function, several animations can be sequenced together. See the examples for more information.
--- If you call go.animate() from a game object's final() function,
---any passed complete_function will be ignored and never called upon animation completion.
---See the <a href="/manuals/properties">properties guide</a> for which properties can be animated and the <a href="/manuals/animation">animation guide</a> for how to animate them.
---@param url string | hash | url url of the game object or component having the property
---@param property string | hash id of the property to animate
---@param playback constant playback mode of the animation <ul> go.PLAYBACK_ONCE_FORWARD go.PLAYBACK_ONCE_BACKWARD go.PLAYBACK_ONCE_PINGPONG go.PLAYBACK_LOOP_FORWARD go.PLAYBACK_LOOP_BACKWARD go.PLAYBACK_LOOP_PINGPONG </ul>
---@param to number | vector3 | vector4 | quaternion target property value
---@param easing constant | vector easing to use during animation. Either specify a constant, see the <a href="/manuals/animation">animation guide</a> for a complete list, or a vmath.vector with a curve
---@param duration number duration of the animation in seconds
---@param [delay] number delay before the animation starts in seconds
---@param [complete_function] function(self, url, property)|object|url|hash optional function to call when the animation has completed <dl> <dt>self</dt> <dd>  The current object. </dd> <dt>url</dt> <dd>  The game object or component instance for which the property is animated. </dd> <dt>property</dt> <dd>  The id of the animated property. </dd> </dl>
    function go.animate(url, property, playback, to, easing, duration, delay, complete_function) end
---By calling this function, all stored animations of the given property will be canceled.
---See the <a href="/manuals/properties">properties guide</a> for which properties can be animated and the <a href="/manuals/animation">animation guide</a> for how to animate them.
---@param url string | hash | url url of the game object or component having the property
---@param property string | hash ide of the property to animate
    function go.cancel_animations(url, property) end
---Delete one or more game objects identified by id.
---@param [id] string | hash | url | table optional id or table of id's of the instance(s) to delete, the instance of the calling script is deleted by default
---@param [recursive] boolean optional boolean, set to true to recursively delete child hiearchy in child to parent order
    function go.delete(id, recursive) end
---@param url string | hash | url url of the game object or component having the property
---@param property string | hash id of the property to retrieve
---@return any the value of the specified property
    function go.get(url, property) end
---Returns or constructs an instance identifier. The instance id is a hash
---of the absolute path to the instance.
---<ul>
---If path is specified, it can either be absolute or relative to the instance of the calling script.
---If path is not specified, the id of the game object instance the script is attached to will be returned.
---</ul>
---@param [path] string path of the instance for which to return the id
---@return hash instance id
    function go.get_id(path) end
---The position is relative the parent (if any). Use <a href="/ref/go#go.get_world_position">go.get_world_position</a> to retrieve the global world position.
---@param [id] string | hash | url optional id of the game object instance to get the position for, by default the instance of the calling script
---@return vector3 instance position
    function go.get_position(id) end
---The rotation is relative to the parent (if any). Use <a href="/ref/go#go.get_world_rotation">go.get_world_rotation</a> to retrieve the global world position.
---@param [id] string | hash | url optional id of the game object instance to get the rotation for, by default the instance of the calling script
---@return quaternion instance rotation
    function go.get_rotation(id) end
---The scale is relative the parent (if any). Use <a href="/ref/go#go.get_world_scale">go.get_world_scale</a> to retrieve the global world 3D scale factor.
---@param [id] string | hash | url optional id of the game object instance to get the scale for, by default the instance of the calling script
---@return vector3 instance scale factor
    function go.get_scale(id) end
---The uniform scale is relative the parent (if any). If the underlying scale vector is non-uniform the min element of the vector is returned as the uniform scale factor.
---@param [id] string | hash | url optional id of the game object instance to get the uniform scale for, by default the instance of the calling script
---@return number uniform instance scale factor
    function go.get_scale_uniform(id) end
---Use <a href="/ref/go#go.get_position">go.get_position</a> to retrieve the position relative to the parent.
---@param [id] string | hash | url optional id of the game object instance to get the world position for, by default the instance of the calling script
---@return vector3 instance world position
    function go.get_world_position(id) end
---Use go.get_rotation to retrieve the rotation relative to the parent.
---@param [id] string | hash | url optional id of the game object instance to get the world rotation for, by default the instance of the calling script
---@return quaternion instance world rotation
    function go.get_world_rotation(id) end
---Use go.get_scale to retrieve the 3D scale factor relative to the parent.
---This vector is derived by decomposing the transformation matrix and should be used with care.
---For most cases it should be fine to use <a href="/ref/go#go.get_world_scale_uniform">go.get_world_scale_uniform</a> instead.
---@param [id] string | hash | url optional id of the game object instance to get the world scale for, by default the instance of the calling script
---@return vector3 instance world 3D scale factor
    function go.get_world_scale(id) end
---Use go.get_scale_uniform to retrieve the scale factor relative to the parent.
---@param [id] string | hash | url optional id of the game object instance to get the world scale for, by default the instance of the calling script
---@return number instance world scale factor
    function go.get_world_scale_uniform(id) end
---This function defines a property which can then be used in the script through the self-reference.
---The properties defined this way are automatically exposed in the editor in game objects and collections which use the script.
---Note that you can only use this function outside any callback-functions like init and update.
---@param name string the id of the property
---@param value number | hash | url | vector3 | vector4 | quaternion default value of the property. In the case of a url, only the empty constructor msg.url() is allowed
    function go.property(name, value) end
---@param url string | hash | url url of the game object or component having the property
---@param property string | hash id of the property to set
---@param value any the value to set
    function go.set(url, property, value) end
---The position is relative to the parent (if any). The global world position cannot be manually set.
---@param position vector3 position to set
---@param [id] string | hash | url optional id of the game object instance to set the position for, by default the instance of the calling script
    function go.set_position(position, id) end
---The rotation is relative to the parent (if any). The global world rotation cannot be manually set.
---@param rotation quaternion rotation to set
---@param [id] string | hash | url optional id of the game object instance to get the rotation for, by default the instance of the calling script
    function go.set_rotation(rotation, id) end
---The scale factor is relative to the parent (if any). The global world scale factor cannot be manually set.
--- Physics are currently not affected when setting scale from this function.
---@param scale number | vector3 vector or uniform scale factor, must be greater than 0
---@param [id] string | hash | url optional id of the game object instance to get the scale for, by default the instance of the calling script
    function go.set_scale(scale, id) end
---@class init
local init = {}
---This is a callback-function, which is called by the engine when a script component is initialized. It can be used
---to set the initial state of the script.
---@param self object reference to the script state to be used for storing data
    function init(self) end
---@class on_input
local on_input = {}
---This is a callback-function, which is called by the engine when user input is sent to the game object instance of the script.
---It can be used to take action on the input, e.g. move the instance according to the input.
---For an instance to obtain user input, it must first acquire input focus
---through the message acquire_input_focus.
---Any instance that has obtained input will be put on top of an
---input stack. Input is sent to all listeners on the stack until the
---end of stack is reached, or a listener returns true
---to signal that it wants input to be consumed.
---See the documentation of <a href="#acquire_input_focus">acquire_input_focus</a> for more
---information.
---The action parameter is a table containing data about the input mapped to the
---action_id.
---For mapped actions it specifies the value of the input and if it was just pressed or released.
---Actions are mapped to input in an input_binding-file.
---Mouse movement is specifically handled and uses nil as its action_id.
---The action only contains positional parameters in this case, such as x and y of the pointer.
---Here is a brief description of the available table fields:
---<table>
---<thead>
---<tr>
---<th>Field</th>
---<th>Description</th>
---</tr>
---</thead>
---<tbody>
---<tr>
---<td>value</td>
---<td>The amount of input given by the user. This is usually 1 for buttons and 0-1 for analogue inputs. This is not present for mouse movement.</td>
---</tr>
---<tr>
---<td>pressed</td>
---<td>If the input was pressed this frame, 0 for false and 1 for true. This is not present for mouse movement.</td>
---</tr>
---<tr>
---<td>released</td>
---<td>If the input was released this frame, 0 for false and 1 for true. This is not present for mouse movement.</td>
---</tr>
---<tr>
---<td>repeated</td>
---<td>If the input was repeated this frame, 0 for false and 1 for true. This is similar to how a key on a keyboard is repeated when you hold it down. This is not present for mouse movement.</td>
---</tr>
---<tr>
---<td>x</td>
---<td>The x value of a pointer device, if present.</td>
---</tr>
---<tr>
---<td>y</td>
---<td>The y value of a pointer device, if present.</td>
---</tr>
---<tr>
---<td>screen_x</td>
---<td>The screen space x value of a pointer device, if present.</td>
---</tr>
---<tr>
---<td>screen_y</td>
---<td>The screen space y value of a pointer device, if present.</td>
---</tr>
---<tr>
---<td>dx</td>
---<td>The change in x value of a pointer device, if present.</td>
---</tr>
---<tr>
---<td>dy</td>
---<td>The change in y value of a pointer device, if present.</td>
---</tr>
---<tr>
---<td>screen_dx</td>
---<td>The change in screen space x value of a pointer device, if present.</td>
---</tr>
---<tr>
---<td>screen_dy</td>
---<td>The change in screen space y value of a pointer device, if present.</td>
---</tr>
---<tr>
---<td>gamepad</td>
---<td>The index of the gamepad device that provided the input.</td>
---</tr>
---<tr>
---<td>touch</td>
---<td>List of touch input, one element per finger, if present. See table below about touch input</td>
---</tr>
---</tbody>
---</table>
---Touch input table:
---<table>
---<thead>
---<tr>
---<th>Field</th>
---<th>Description</th>
---</tr>
---</thead>
---<tbody>
---<tr>
---<td>id</td>
---<td>A number identifying the touch input during its duration.</td>
---</tr>
---<tr>
---<td>pressed</td>
---<td>True if the finger was pressed this frame.</td>
---</tr>
---<tr>
---<td>released</td>
---<td>True if the finger was released this frame.</td>
---</tr>
---<tr>
---<td>tap_count</td>
---<td>Number of taps, one for single, two for double-tap, etc</td>
---</tr>
---<tr>
---<td>x</td>
---<td>The x touch location.</td>
---</tr>
---<tr>
---<td>y</td>
---<td>The y touch location.</td>
---</tr>
---<tr>
---<td>dx</td>
---<td>The change in x value.</td>
---</tr>
---<tr>
---<td>dy</td>
---<td>The change in y value.</td>
---</tr>
---<tr>
---<td>acc_x</td>
---<td>Accelerometer x value (if present).</td>
---</tr>
---<tr>
---<td>acc_y</td>
---<td>Accelerometer y value (if present).</td>
---</tr>
---<tr>
---<td>acc_z</td>
---<td>Accelerometer z value (if present).</td>
---</tr>
---</tbody>
---</table>
---@param self object reference to the script state to be used for storing data
---@param action_id hash id of the received input action, as mapped in the input_binding-file
---@param action table a table containing the input data, see above for a description
---@return boolean optional boolean to signal if the input should be consumed (not passed on to others) or not, default is false
    function on_input(self, action_id, action) end
---@class on_message
local on_message = {}
---This is a callback-function, which is called by the engine whenever a message has been sent to the script component.
---It can be used to take action on the message, e.g. send a response back to the sender of the message.
---The message parameter is a table containing the message data. If the message is sent from the engine, the
---documentation of the message specifies which data is supplied.
---@param self object reference to the script state to be used for storing data
---@param message_id hash id of the received message
---@param message table a table containing the message data
---@param sender url address of the sender
    function on_message(self, message_id, message, sender) end
---@class on_reload
local on_reload = {}
---This is a callback-function, which is called by the engine when the script component is reloaded, e.g. from the editor.
---It can be used for live development, e.g. to tweak constants or set up the state properly for the instance.
---@param self object reference to the script state to be used for storing data
    function on_reload(self) end
---@class update
local update = {}
---This is a callback-function, which is called by the engine every frame to update the state of a script component.
---It can be used to perform any kind of game related tasks, e.g. moving the game object instance.
---@param self object reference to the script state to be used for storing data
---@param dt number the time-step of the frame update
    function update(self, dt) end
return final