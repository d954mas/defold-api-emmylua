--GUI API documentation
--GUI core hooks, functions, messages, properties and constants for
--creation and manipulation of GUI nodes. The "gui" namespace is
--accessible only from gui scripts.
---@class final
local final = {}
---This is a callback-function, which is called by the engine when a gui component is finalized (destroyed). It can
---be used to e.g. take some last action, report the finalization to other game object instances
---or release user input focus (see release_input_focus). There is no use in starting any animations or similar
---from this function since the gui component is about to be destroyed.
---@param self object reference to the script state to be used for storing data
    function final(self) end
---@class gui
local gui = {}
    gui.ADJUST_FIT = nil
    gui.ADJUST_STRETCH = nil
    gui.ADJUST_ZOOM = nil
    gui.ANCHOR_BOTTOM = nil
    gui.ANCHOR_LEFT = nil
    gui.ANCHOR_RIGHT = nil
    gui.ANCHOR_TOP = nil
    gui.BLEND_ADD = nil
    gui.BLEND_ADD_ALPHA = nil
    gui.BLEND_ALPHA = nil
    gui.BLEND_MULT = nil
    gui.CLIPPING_MODE_NONE = nil
    gui.CLIPPING_MODE_STENCIL = nil
    gui.EASING_INBACK = nil
    gui.EASING_INBOUNCE = nil
    gui.EASING_INCIRC = nil
    gui.EASING_INCUBIC = nil
    gui.EASING_INELASTIC = nil
    gui.EASING_INEXPO = nil
    gui.EASING_INOUTBACK = nil
    gui.EASING_INOUTBOUNCE = nil
    gui.EASING_INOUTCIRC = nil
    gui.EASING_INOUTCUBIC = nil
    gui.EASING_INOUTELASTIC = nil
    gui.EASING_INOUTEXPO = nil
    gui.EASING_INOUTQUAD = nil
    gui.EASING_INOUTQUART = nil
    gui.EASING_INOUTQUINT = nil
    gui.EASING_INOUTSINE = nil
    gui.EASING_INQUAD = nil
    gui.EASING_INQUART = nil
    gui.EASING_INQUINT = nil
    gui.EASING_INSINE = nil
    gui.EASING_LINEAR = nil
    gui.EASING_OUTBACK = nil
    gui.EASING_OUTBOUNCE = nil
    gui.EASING_OUTCIRC = nil
    gui.EASING_OUTCUBIC = nil
    gui.EASING_OUTELASTIC = nil
    gui.EASING_OUTEXPO = nil
    gui.EASING_OUTINBACK = nil
    gui.EASING_OUTINBOUNCE = nil
    gui.EASING_OUTINCIRC = nil
    gui.EASING_OUTINCUBIC = nil
    gui.EASING_OUTINELASTIC = nil
    gui.EASING_OUTINEXPO = nil
    gui.EASING_OUTINQUAD = nil
    gui.EASING_OUTINQUART = nil
    gui.EASING_OUTINQUINT = nil
    gui.EASING_OUTINSINE = nil
    gui.EASING_OUTQUAD = nil
    gui.EASING_OUTQUART = nil
    gui.EASING_OUTQUINT = nil
    gui.EASING_OUTSINE = nil
    gui.KEYBOARD_TYPE_DEFAULT = nil
    gui.KEYBOARD_TYPE_EMAIL = nil
    gui.KEYBOARD_TYPE_NUMBER_PAD = nil
    gui.KEYBOARD_TYPE_PASSWORD = nil
    gui.PIEBOUNDS_ELLIPSE = nil
    gui.PIEBOUNDS_RECTANGLE = nil
    gui.PIVOT_CENTER = nil
    gui.PIVOT_E = nil
    gui.PIVOT_N = nil
    gui.PIVOT_NE = nil
    gui.PIVOT_NW = nil
    gui.PIVOT_S = nil
    gui.PIVOT_SE = nil
    gui.PIVOT_SW = nil
    gui.PIVOT_W = nil
    gui.PLAYBACK_LOOP_BACKWARD = nil
    gui.PLAYBACK_LOOP_FORWARD = nil
    gui.PLAYBACK_LOOP_PINGPONG = nil
    gui.PLAYBACK_ONCE_BACKWARD = nil
    gui.PLAYBACK_ONCE_FORWARD = nil
    gui.PLAYBACK_ONCE_PINGPONG = nil
    gui.PROP_COLOR = nil
    gui.PROP_FILL_ANGLE = nil
    gui.PROP_INNER_RADIUS = nil
    gui.PROP_OUTLINE = nil
    gui.PROP_POSITION = nil
    gui.PROP_ROTATION = nil
    gui.PROP_SCALE = nil
    gui.PROP_SHADOW = nil
    gui.PROP_SIZE = nil
    gui.PROP_SLICE9 = nil
    gui.SIZE_MODE_AUTO = nil
    gui.SIZE_MODE_MANUAL = nil
---This starts an animation of a node property according to the specified parameters.
---If the node property is already being animated, that animation will be canceled and
---replaced by the new one. Note however that several different node properties
---can be animated simultaneously. Use gui.cancel_animation to stop the animation
---before it has completed.
---Composite properties of type vector3, vector4 or quaternion
---also expose their sub-components (x, y, z and w).
---You can address the components individually by suffixing the name with a dot '.'
---and the name of the component.
---For instance, "position.x" (the position x coordinate) or "color.w"
---(the color alpha value).
---If a complete_function (Lua function) is specified, that function will be called
---when the animation has completed.
---By starting a new animation in that function, several animations can be sequenced
---together. See the examples below for more information.
---@param node node node to animate
---@param property string | constant property to animate <ul> "position" "rotation" "scale" "color" "outline" "shadow" "size" "fill_angle" (pie) "inner_radius" (pie) "slice9" (slice9) </ul> The following property constants are defined equaling the corresponding property string names. <ul> gui.PROP_POSITION gui.PROP_ROTATION gui.PROP_SCALE gui.PROP_COLOR gui.PROP_OUTLINE gui.PROP_SHADOW gui.PROP_SIZE gui.PROP_FILL_ANGLE gui.PROP_INNER_RADIUS gui.PROP_SLICE9 </ul>
---@param to vector3 | vector4 target property value
---@param easing constant | vector|vector easing to use during animation.      Either specify one of the gui.EASING_* constants or provide a       with a custom curve.
---@param duration number duration of the animation in seconds.
---@param [delay] number delay before the animation starts in seconds.
---@param [complete_function] function(self, node) function to call when the      animation has completed
---@param [playback] constant playback mode <ul> gui.PLAYBACK_ONCE_FORWARD gui.PLAYBACK_ONCE_BACKWARD gui.PLAYBACK_ONCE_PINGPONG gui.PLAYBACK_LOOP_FORWARD gui.PLAYBACK_LOOP_BACKWARD gui.PLAYBACK_LOOP_PINGPONG </ul>
    function gui.animate(node, property, to, easing, duration, delay, complete_function, playback) end
---If an animation of the specified node is currently running (started by gui.animate), it will immediately be canceled.
---@param node node node that should have its animation canceled
---@param property string | constant property for which the animation should be canceled <ul> "position" "rotation" "scale" "color" "outline" "shadow" "size" "fill_angle" (pie) "inner_radius" (pie) "slice9" (slice9) </ul>
    function gui.cancel_animation(node, property) end
---Cancels any running flipbook animation on the specified node.
---@param node node node cancel flipbook animation for
    function gui.cancel_flipbook(node) end
---@param node node spine node that should cancel its animation
    function gui.cancel_spine(node) end
---Make a clone instance of a node.
---This function does not clone the supplied node's children nodes.
---Use gui.clone_tree for that purpose.
---@param node node node to clone
---@return node the cloned node
    function gui.clone(node) end
---Make a clone instance of a node and all its children.
---Use gui.clone to clone a node excluding its children.
---@param node node root node to clone
---@return table a table mapping node ids to the corresponding cloned nodes
    function gui.clone_tree(node) end
---Deletes the specified node. Any child nodes of the specified node will be
---recursively deleted.
---@param node node node to delete
    function gui.delete_node(node) end
---Delete a dynamically created texture.
---@param texture string | hash texture id
    function gui.delete_texture(texture) end
---Returns the adjust mode of a node.
---The adjust mode defines how the node will adjust itself to screen
---resolutions that differs from the one in the project settings.
---@param node node node from which to get the adjust mode (node)
---@return constant the current adjust mode <ul> gui.ADJUST_FIT gui.ADJUST_ZOOM gui.ADJUST_STRETCH </ul>
    function gui.get_adjust_mode(node) end
---Returns the blend mode of a node.
---Blend mode defines how the node will be blended with the background.
---@param node node node from which to get the blend mode
---@return constant blend mode <ul> gui.BLEND_ALPHA gui.BLEND_ADD gui.BLEND_ADD_ALPHA gui.BLEND_MULT </ul>
    function gui.get_blend_mode(node) end
---If node is set as an inverted clipping node, it will clip anything inside as opposed to outside.
---@param node node node from which to get the clipping inverted state
---@return boolean true or false
    function gui.get_clipping_inverted(node) end
---Clipping mode defines how the node will clipping it's children nodes
---@param node node node from which to get the clipping mode
---@return constant clipping mode <ul>   gui.CLIPPING_MODE_NONE   gui.CLIPPING_MODE_STENCIL </ul>
    function gui.get_clipping_mode(node) end
---If node is set as visible clipping node, it will be shown as well as clipping. Otherwise, it will only clip but not show visually.
---@param node node node from which to get the clipping visibility state
---@return boolean true or false
    function gui.get_clipping_visible(node) end
---Returns the color of the supplied node. The components
---of the returned vector4 contains the color channel values:
---<table>
---<thead>
---<tr>
---<th>Component</th>
---<th>Color value</th>
---</tr>
---</thead>
---<tbody>
---<tr>
---<td>x</td>
---<td>Red value</td>
---</tr>
---<tr>
---<td>y</td>
---<td>Green value</td>
---</tr>
---<tr>
---<td>z</td>
---<td>Blue value</td>
---</tr>
---<tr>
---<td>w</td>
---<td>Alpha value</td>
---</tr>
---</tbody>
---</table>
---@param node node node to get the color from
---@return vector4 node color
    function gui.get_color(node) end
---Returns the sector angle of a pie node.
---@param node node node from which to get the fill angle
---@return number sector angle
    function gui.get_fill_angle(node) end
---Get node flipbook animation.
---@param node node node to get flipbook animation from
---@return hash animation id
    function gui.get_flipbook(node) end
---This is only useful for text nodes. The font must be mapped to the gui scene in the gui editor.
---@param node node node from which to get the font
---@return hash font id
    function gui.get_font(node) end
---Returns the scene height.
    function gui.get_height() end
---Retrieves the id of the specified node.
---@param node node the node to retrieve the id from
---@return hash the id of the node
    function gui.get_id(node) end
---Retrieve the index of the specified node.
---The index defines the order in which a node appear in a GUI scene.
---Higher index means the node is drawn on top of lower indexed nodes.
---@param node node the node to retrieve the id from
---@return number the index of the node
    function gui.get_index(node) end
---@param node node node from which to get the inherit alpha state
    function gui.get_inherit_alpha(node) end
---Returns the inner radius of a pie node.
---The radius is defined along the x-axis.
---@param node node node from where to get the inner radius
---@return number inner radius
    function gui.get_inner_radius(node) end
---The layer must be mapped to the gui scene in the gui editor.
---@param node node node from which to get the layer
---@return hash layer id
    function gui.get_layer(node) end
    function gui.get_layout() end
---Returns the leading value for a text node.
---@param node node node from where to get the leading
---@return number leading scaling value (default=1)
    function gui.get_leading(node) end
---Returns whether a text node is in line-break mode or not.
---This is only useful for text nodes.
---@param node node node from which to get the line-break for
---@return boolean true or false
    function gui.get_line_break(node) end
---Retrieves the node with the specified id.
---@param id string | hash id of the node to retrieve
---@return node a new node instance
    function gui.get_node(id) end
---Returns the outer bounds mode for a pie node.
---@param node node node from where to get the outer bounds mode
---@return constant the outer bounds mode of the pie node: <ul> gui.PIEBOUNDS_RECTANGLE gui.PIEBOUNDS_ELLIPSE </ul>
    function gui.get_outer_bounds(node) end
---Returns the outline color of the supplied node.
---See <a href="/ref/gui#gui.get_color">gui.get_color</a> for info how vectors encode color values.
---@param node node node to get the outline color from
---@return vector4 outline color
    function gui.get_outline(node) end
---Returns the parent node of the specified node.
---If the supplied node does not have a parent, nil is returned.
---@param node node the node from which to retrieve its parent
---@return node parent instance or nil
    function gui.get_parent(node) end
---Get the paricle fx for a gui node
---@param node node node to get particle fx for
---@returnparticle fx id
    function gui.get_particlefx(node) end
---Returns the number of generated vertices around the perimeter
---of a pie node.
---@param node node pie node
---@return number vertex count
    function gui.get_perimeter_vertices(node) end
---The pivot specifies how the node is drawn and rotated from its position.
---@param node node node to get pivot from
---@return constant pivot constant <ul>   gui.PIVOT_CENTER   gui.PIVOT_N   gui.PIVOT_NE   gui.PIVOT_E   gui.PIVOT_SE   gui.PIVOT_S   gui.PIVOT_SW   gui.PIVOT_W   gui.PIVOT_NW </ul>
    function gui.get_pivot(node) end
---Returns the position of the supplied node.
---@param node node node to get the position from
---@return vector3 node position
    function gui.get_position(node) end
---Returns the rotation of the supplied node.
---The rotation is expressed in degree Euler angles.
---@param node node node to get the rotation from
---@return vector3 node rotation
    function gui.get_rotation(node) end
---Returns the scale of the supplied node.
---@param node node node to get the scale from
---@return vector3 node scale
    function gui.get_scale(node) end
---Returns the screen position of the supplied node.
---@param node node node to get the screen position from
---@return vector3 node screen position
    function gui.get_screen_position(node) end
---Returns the shadow color of the supplied node.
---See <a href="/ref/gui#gui.get_color">gui.get_color</a> for info how vectors encode color values.
---@param node node node to get the shadow color from
---@return vector4 node shadow color
    function gui.get_shadow(node) end
---Returns the size of the supplied node.
---@param node node node to get the size from
---@return vector3 node size
    function gui.get_size(node) end
---Returns the size of a node.
---The size mode defines how the node will adjust itself in size. Automatic
---size mode alters the node size based on the node's content.
---@param node node node from which to get the size mode (node)
---@return constant the current size mode <ul> gui.SIZE_MODE_MANUAL gui.SIZE_MODE_AUTO </ul>
    function gui.get_size_mode(node) end
---Returns the slice9 configuration values for the node.
---@param node node node to manipulate
---@return vector4 configuration values
    function gui.get_slice9(node) end
---The returned node can be used for parenting and transform queries.
---This function has complexity O(n), where n is the number of bones in the spine model skeleton.
---@param node node spine node to query for bone node
---@param bone_id string | hash id of the corresponding bone
---@return node node corresponding to the spine bone
    function gui.get_spine_bone(node, bone_id) end
---This is only useful for spine nodes. Gets the normalized cursor of the animation on a spine node.
---@param nodespine node to set the cursor for (node)
---@return numbervalue  cursor value
    function gui.get_spine_cursor(node) end
---This is only useful for spine nodes. Gets the playback rate of the animation on a spine node.
---@param node node spine node to set the cursor for
---@return number playback rate
    function gui.get_spine_playback_rate(node) end
---Returns the spine scene id of the supplied node.
---This is currently only useful for spine nodes.
---The returned spine scene must be mapped to the gui scene in the gui editor.
---@param node node node to get texture from
---@return hash spine scene id
    function gui.get_spine_scene(node) end
---Gets the spine skin of a spine node
---@param node node node to get spine skin from
---@return hash spine skin id, 0 if no explicit skin is set
    function gui.get_spine_skin(node) end
---Returns the text value of a text node. This is only useful for text nodes.
---@param node node node from which to get the text
---@return string text value
    function gui.get_text(node) end
---Get text metrics given the provided font, text and parameters.
---@param font string | hash font id
---@param text string text to measure
---@param width number max-width. Use for line-breaks (default=FLT_MAX)
---@param line_breaks boolean true to break lines accordingly to width (default=false)
---@param leading number scale value for line spacing (default=1)
---@param tracking number scale value for letter spacing (default=0)
---@return table a table with the following fields: <ul> width height max_ascent max_descent </ul>
    function gui.get_text_metrics(font, text, width, line_breaks, leading, tracking) end
---Get the text metrics from a text node.
---@param node node text node to measure text from
---@return table a table with the following fields: <ul> width height max_ascent max_descent </ul>
    function gui.get_text_metrics_from_node(node) end
---Returns the texture of a node.
---This is currently only useful for box or pie nodes.
---The texture must be mapped to the gui scene in the gui editor.
---@param node node node to get texture from
---@return hash texture id
    function gui.get_texture(node) end
---Returns the tracking value of a text node.
---@param node node node from where to get the tracking
---@return number tracking scaling number (default=0)
    function gui.get_tracking(node) end
---Returns the scene width.
    function gui.get_width() end
---The x-anchor specifies how the node is moved when the game is run in a different resolution.
---@param node node node to get x-anchor from
---@return constant anchor constant <ul> gui.ANCHOR_NONE gui.ANCHOR_LEFT gui.ANCHOR_RIGHT </ul>
    function gui.get_xanchor(node) end
---The y-anchor specifies how the node is moved when the game is run in a different resolution.
---@param node node node to get y-anchor from
---@return constant anchor constant <ul> gui.ANCHOR_NONE gui.ANCHOR_TOP gui.ANCHOR_BOTTOM </ul>
    function gui.get_yanchor(node) end
---Hides the on-display touch keyboard on the device.
    function gui.hide_keyboard() end
---Returns true if a node is enabled and false if it's not.
---Disabled nodes are not rendered and animations acting on them are not evaluated.
---@param node node node to query
---@return boolean whether the node is enabled or not
    function gui.is_enabled(node) end
---Alters the ordering of the two supplied nodes by moving the first node
---above the second.
---If the second argument is nil the first node is moved to the top.
---@param node node to move
---@param node node | nil reference node above which the first node should be moved
    function gui.move_above(node, node) end
---Alters the ordering of the two supplied nodes by moving the first node
---below the second.
---If the second argument is nil the first node is moved to the bottom.
---@param node node to move
---@param node node | nil reference node below which the first node should be moved
    function gui.move_below(node, node) end
---Dynamically create a new box node.
---@param pos vector3 | vector4 node position
---@param size vector3 node size
---@return node new box node
    function gui.new_box_node(pos, size) end
---Dynamically create a particle fx node.
---@param pos vector3 | vector4 node position
---@param particlefx hash | string particle fx resource name
---@return node new particle fx node
    function gui.new_particlefx_node(pos, particlefx) end
---Dynamically create a new pie node.
---@param pos vector3 | vector4 node position
---@param size vector3 node size
---@return node new box node
    function gui.new_pie_node(pos, size) end
---Dynamically create a new spine node.
---@param pos vector3 | vector4 node position
---@param spine_scene string | hash spine scene id
---@return node new spine node
    function gui.new_spine_node(pos, spine_scene) end
---Dynamically create a new text node.
---@param pos vector3 | vector4 node position
---@param text string node text
---@return node new text node
    function gui.new_text_node(pos, text) end
---Dynamically create a new texture.
---@param texture string | hash texture id
---@param width number texture width
---@param height number texture height
---@param type string | constant texture type <ul> "rgb" - RGB "rgba" - RGBA "l" - LUMINANCE </ul>
---@param buffer string texture data
---@param flip boolean flip texture vertically
---@return boolean texture creation was successful
    function gui.new_texture(texture, width, height, type, buffer, flip) end
---Tests whether a coordinate is within the bounding box of a
---node.
---@param node node node to be tested for picking
---@param x number x-coordinate (see <a href="#on_input">on_input</a> )
---@param y number y-coordinate (see <a href="#on_input">on_input</a> )
---@return boolean pick result
    function gui.pick_node(node, x, y) end
---Play flipbook animation on a box or pie node.
---The current node texture must contain the animation.
---Use this function to set one-frame still images on the node.
---@param node node node to set animation for
---@param animation string | hash animation id
---@param [complete_function] function(self, node)|object|node optional function to call when the animation has completed <dl> <dt>self</dt> <dd>  The current object. </dd> <dt>node</dt> <dd>  The node that is animated. </dd> </dl>
    function gui.play_flipbook(node, animation, complete_function) end
---Plays the paricle fx for a gui node
---@param node node node to play particle fx for
---@param [emitter_state_function] function(self, node, emitter, state)|object|hash|hash|constant optional callback function that will be called when an emitter attached to this particlefx changes state. <dl> <dt>self</dt> <dd> The current object</dd> <dt>id</dt> <dd> The id of the particle fx component</dd> <dt>emitter</dt> <dd> The id of the emitter</dd> <dt>state</dt> <dd> the new state of the emitter:</dd> </dl> <ul> gui.EMITTER_STATE_SLEEPING gui.EMITTER_STATE_PRESPAWN gui.EMITTER_STATE_SPAWNING gui.EMITTER_STATE_POSTSPAWN </ul>
    function gui.play_particlefx(node, emitter_state_function) end
---Starts a spine animation.
---@param node node spine node that should play the animation
---@param animation_id string | hash id of the animation to play
---@param playback constant playback mode <ul> gui.PLAYBACK_ONCE_FORWARD gui.PLAYBACK_ONCE_BACKWARD gui.PLAYBACK_ONCE_PINGPONG gui.PLAYBACK_LOOP_FORWARD gui.PLAYBACK_LOOP_BACKWARD gui.PLAYBACK_LOOP_PINGPONG </ul>
---@param [play_properties] table|number|number|number optional table with properties <dl> <dt>blend_duration</dt> <dd> The duration of a linear blend between the current and new animation</dd> <dt>offset</dt> <dd> The normalized initial value of the animation cursor when the animation starts playing</dd> <dt>playback_rate</dt> <dd> The rate with which the animation will be played. Must be positive</dd> </dl>
---@param [complete_function] function(self, node) function to call when the animation has completed
    function gui.play_spine_anim(node, animation_id, playback, play_properties, complete_function) end
---Resets the input context of keyboard. This will clear marked text.
    function gui.reset_keyboard() end
---Resets all nodes in the current GUI scene to their initial state.
---The reset only applies to static node loaded from the scene.
---Nodes that are created dynamically from script are not affected.
    function gui.reset_nodes() end
---Sets the adjust mode on a node.
---The adjust mode defines how the node will adjust itself to screen
---resolutions that differs from the one in the project settings.
---@param node node node to set adjust mode for
---@param adjust_mode constant adjust mode to set <ul> gui.ADJUST_FIT gui.ADJUST_ZOOM gui.ADJUST_STRETCH </ul>
    function gui.set_adjust_mode(node, adjust_mode) end
---Set the blend mode of a node.
---Blend mode defines how the node will be blended with the background.
---@param node node node to set blend mode for
---@param blend_mode constant blend mode to set <ul> gui.BLEND_ALPHA gui.BLEND_ADD gui.BLEND_ADD_ALPHA gui.BLEND_MULT </ul>
    function gui.set_blend_mode(node, blend_mode) end
---If node is set as an inverted clipping node, it will clip anything inside as opposed to outside.
---@param node node node to set clipping inverted state for
---@param inverted boolean true or false
    function gui.set_clipping_inverted(node, inverted) end
---Clipping mode defines how the node will clipping it's children nodes
---@param node node node to set clipping mode for
---@param clipping_mode constant clipping mode to set <ul>   gui.CLIPPING_MODE_NONE   gui.CLIPPING_MODE_STENCIL </ul>
    function gui.set_clipping_mode(node, clipping_mode) end
---If node is set as an visible clipping node, it will be shown as well as clipping. Otherwise, it will only clip but not show visually.
---@param node node node to set clipping visibility for
---@param visible boolean true or false
    function gui.set_clipping_visible(node, visible) end
---Sets the color of the supplied node. The components
---of the supplied vector3 or vector4 should contain the color channel values:
---<table>
---<thead>
---<tr>
---<th>Component</th>
---<th>Color value</th>
---</tr>
---</thead>
---<tbody>
---<tr>
---<td>x</td>
---<td>Red value</td>
---</tr>
---<tr>
---<td>y</td>
---<td>Green value</td>
---</tr>
---<tr>
---<td>z</td>
---<td>Blue value</td>
---</tr>
---<tr>
---<td>w vector4</td>
---<td>Alpha value</td>
---</tr>
---</tbody>
---</table>
---@param node node node to set the color for
---@param color vector3 | vector4 new color
    function gui.set_color(node, color) end
---Sets a node to the disabled or enabled state.
---Disabled nodes are not rendered and animations acting on them are not evaluated.
---@param node node node to be enabled/disabled
---@param enabled boolean whether the node should be enabled or not
    function gui.set_enabled(node, enabled) end
---Set the sector angle of a pie node.
---@param node node node to set the fill angle for
---@param angle number sector angle
    function gui.set_fill_angle(node, angle) end
---This is only useful for text nodes.
---The font must be mapped to the gui scene in the gui editor.
---@param node node node for which to set the font
---@param font string | hash font id
    function gui.set_font(node, font) end
---Set the id of the specicied node to a new value.
---Nodes created with the gui.new_*_node() functions get
---an empty id. This function allows you to give dynamically
---created nodes an id.
--- No checking is done on the uniqueness of supplied ids.
---It is up to you to make sure you use unique ids.
---@param node node node to set the id for
---@param id string | hash id to set
    function gui.set_id(node, id) end
---@param node node node from which to set the inherit alpha state
---@param inherit_alpha boolean true or false
    function gui.set_inherit_alpha(node, inherit_alpha) end
---Sets the inner radius of a pie node.
---The radius is defined along the x-axis.
---@param node node node to set the inner radius for
---@param radius number inner radius
    function gui.set_inner_radius(node, radius) end
---The layer must be mapped to the gui scene in the gui editor.
---@param node node node for which to set the layer
---@param layer string | hash layer id
    function gui.set_layer(node, layer) end
---Sets the leading value for a text node. This value is used to
---scale the line spacing of text.
---@param node node node for which to set the leading
---@param leading number a scaling value for the line spacing (default=1)
    function gui.set_leading(node, leading) end
---Sets the line-break mode on a text node.
---This is only useful for text nodes.
---@param node node node to set line-break for
---@param line-break boolean true or false
    function gui.set_line_break(node, line-break) end
---Sets the outer bounds mode for a pie node.
---@param node node node for which to set the outer bounds mode
---@param bounds_mode constant the outer bounds mode of the pie node: <ul> gui.PIEBOUNDS_RECTANGLE gui.PIEBOUNDS_ELLIPSE </ul>
    function gui.set_outer_bounds(node, bounds_mode) end
---Sets the outline color of the supplied node.
---See <a href="/ref/gui#gui.set_color">gui.set_color</a> for info how vectors encode color values.
---@param node node node to set the outline color for
---@param color vector3 | vector4 new outline color
    function gui.set_outline(node, color) end
---Sets the parent node of the specified node.
---@param node node node for which to set its parent
---@param parent node parent node to set
    function gui.set_parent(node, parent) end
---Set the paricle fx for a gui node
---@param node node node to set particle fx for
---@param particlefx hash | string particle fx id
    function gui.set_particlefx(node, particlefx) end
---Sets the number of generated vertices around the perimeter of a pie node.
---@param node node pie node
---@param vertices number vertex count
    function gui.set_perimeter_vertices(node, vertices) end
---The pivot specifies how the node is drawn and rotated from its position.
---@param node node node to set pivot for
---@param pivot constant pivot constant <ul>   gui.PIVOT_CENTER   gui.PIVOT_N   gui.PIVOT_NE   gui.PIVOT_E   gui.PIVOT_SE   gui.PIVOT_S   gui.PIVOT_SW   gui.PIVOT_W   gui.PIVOT_NW </ul>
    function gui.set_pivot(node, pivot) end
---Sets the position of the supplied node.
---@param node node node to set the position for
---@param position vector3 | vector4 new position
    function gui.set_position(node, position) end
---Set the order number for the current GUI scene.
---The number dictates the sorting of the "gui" render predicate,
---in other words in which order the scene will be rendered in relation
---to other currently rendered GUI scenes.
---The number must be in the range 0 to 15.
---@param order number rendering order (0-15)
    function gui.set_render_order(order) end
---Sets the rotation of the supplied node.
---The rotation is expressed in degree Euler angles.
---@param node node node to set the rotation for
---@param rotation vector3 | vector4 new rotation
    function gui.set_rotation(node, rotation) end
---Sets the scaling of the supplied node.
---@param node node node to set the scale for
---@param scale vector3 | vector4 new scale
    function gui.set_scale(node, scale) end
---Sets the shadow color of the supplied node.
---See <a href="/ref/gui#gui.set_color">gui.set_color</a> for info how vectors encode color values.
---@param node node node to set the shadow color for
---@param color vector3 | vector4 new shadow color
    function gui.set_shadow(node, color) end
---Sets the size of the supplied node.
--- You can only set size on nodes with size mode set to SIZE_MODE_MANUAL
---@param node node node to set the size for
---@param size vector3 | vector4 new size
    function gui.set_size(node, size) end
---Sets the size mode of a node.
---The size mode defines how the node will adjust itself in size. Automatic
---size mode alters the node size based on the node's content.
---@param node node node to set size mode for
---@param size_mode constant size mode to set <ul> gui.SIZE_MODE_MANUAL gui.SIZE_MODE_AUTO </ul>
    function gui.set_size_mode(node, size_mode) end
---Set the slice9 configuration values for the node.
---@param node node node to manipulate
---@param values vector4 new values
    function gui.set_slice9(node, values) end
---This is only useful for spine nodes. The cursor is normalized.
---@param node node spine node to set the cursor for
---@param cursor number cursor value
    function gui.set_spine_cursor(node, cursor) end
---This is only useful for spine nodes. Sets the playback rate of the animation on a spine node. Must be positive.
---@param node node spine node to set the cursor for
---@param playback_rate number playback rate
    function gui.set_spine_playback_rate(node, playback_rate) end
---Set the spine scene on a spine node. The spine scene must be mapped to the gui scene in the gui editor.
---@param node node node to set spine scene for
---@param spine_scene string | hash spine scene id
    function gui.set_spine_scene(node, spine_scene) end
---Sets the spine skin on a spine node.
---@param node node node to set the spine skin on
---@param spine_skin string | hash spine skin id
    function gui.set_spine_skin(node, spine_skin) end
---Set the text value of a text node. This is only useful for text nodes.
---@param node node node to set text for
---@param text string text to set
    function gui.set_text(node, text) end
---Set the texture on a box or pie node. The texture must be mapped to
---the gui scene in the gui editor. The function points out which texture
---the node should render from. If the texture is an atlas, further
---information is needed to select which image/animation in the atlas
---to render. In such cases, use gui.play_flipbook() in
---addition to this function.
---@param node node node to set texture for
---@param texture string | hash texture id
    function gui.set_texture(node, texture) end
---Set the texture buffer data for a dynamically created texture.
---@param texture string | hash texture id
---@param width number texture width
---@param height number texture height
---@param type string | constant texture type <ul>   "rgb" - RGB   "rgba" - RGBA   "l" - LUMINANCE </ul>
---@param buffer string texture data
---@param flip boolean flip texture vertically
---@return boolean setting the data was successful
    function gui.set_texture_data(texture, width, height, type, buffer, flip) end
---Sets the tracking value of a text node. This value is used to
---adjust the vertical spacing of characters in the text.
---@param node node node for which to set the tracking
---@param tracking number a scaling number for the letter spacing (default=0)
    function gui.set_tracking(node, tracking) end
---The x-anchor specifies how the node is moved when the game is run in a different resolution.
---@param node node node to set x-anchor for
---@param anchor constant anchor constant <ul> gui.ANCHOR_NONE gui.ANCHOR_LEFT gui.ANCHOR_RIGHT </ul>
    function gui.set_xanchor(node, anchor) end
---The y-anchor specifies how the node is moved when the game is run in a different resolution.
---@param node node node to set y-anchor for
---@param anchor constant anchor constant <ul> gui.ANCHOR_NONE gui.ANCHOR_TOP gui.ANCHOR_BOTTOM </ul>
    function gui.set_yanchor(node, anchor) end
---Shows the on-display touch keyboard.
---The specified type of keyboard is displayed if it is available on
---the device.
---This function is only available on iOS and Android.  .
---@param type constant keyboard type <ul> gui.KEYBOARD_TYPE_DEFAULT gui.KEYBOARD_TYPE_EMAIL gui.KEYBOARD_TYPE_NUMBER_PAD gui.KEYBOARD_TYPE_PASSWORD </ul>
---@param autoclose boolean if the keyboard should automatically close when clicking outside
    function gui.show_keyboard(type, autoclose) end
---Stops the paricle fx for a gui node
---@param node node node to stop particle fx for
    function gui.stop_particlefx(node) end
---@class init
local init = {}
---This is a callback-function, which is called by the engine when a gui component is initialized. It can be used
---to set the initial state of the script and gui scene.
---@param self object reference to the script state to be used for storing data
    function init(self) end
---@class on_input
local on_input = {}
---This is a callback-function, which is called by the engine when user input is sent to the instance of the gui component.
---It can be used to take action on the input, e.g. modify the gui according to the input.
---For an instance to obtain user input, it must first acquire input
---focus through the message acquire_input_focus.
---Any instance that has obtained input will be put on top of an
---input stack. Input is sent to all listeners on the stack until the
---end of stack is reached, or a listener returns true
---to signal that it wants input to be consumed.
---See the documentation of <a href="/ref/go/#acquire_input_focus">acquire_input_focus</a> for more
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
---This is a callback-function, which is called by the engine whenever a message has been sent to the gui component.
---It can be used to take action on the message, e.g. update the gui or send a response back to the sender of the message.
---The message parameter is a table containing the message data. If the message is sent from the engine, the
---documentation of the message specifies which data is supplied.
---See the <a href="#update">update</a> function for examples on how to use this callback-function.
---@param self object reference to the script state to be used for storing data
---@param message_id hash id of the received message
---@param message table a table containing the message data
    function on_message(self, message_id, message) end
---@class on_reload
local on_reload = {}
---
---This is a callback-function, which is called by the engine when the gui script is reloaded, e.g. from the editor.
---It can be used for live development, e.g. to tweak constants or set up the state properly for the script.
---@param self object reference to the script state to be used for storing data
    function on_reload(self) end
---@class update
local update = {}
---This is a callback-function, which is called by the engine every frame to update the state of a gui component.
---It can be used to perform any kind of gui related tasks, e.g. animating nodes.
---@param self object reference to the script state to be used for storing data
---@param dt number the time-step of the frame update
    function update(self, dt) end
return final