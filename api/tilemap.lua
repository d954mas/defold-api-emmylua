---Tilemap API documentation
---Functions and messages used to manipulate tile map components.
---@class tilemap
local tilemap = {}
---Get the bounds for a tile map. This function returns multiple values:
---The lower left corner index x and y coordinates (1-indexed),
---the tile map width and the tile map height.
---
---The resulting values take all tile map layers into account, meaning that
---the bounds are calculated as if all layers were collapsed into one.
---@param url string | hash | url the tile map
---@return x number x coordinate of the bottom left corner
---@return y number y coordinate of the bottom left corner
---@return w number number of columns (width) in the tile map
---@return h number number of rows (height) in the tile map
function tilemap.get_bounds(url) end
---Get the tile set at the specified position in the tilemap.
---The position is identified by the tile index starting at origo
---with index 1, 1. (see tilemap.set_tile() <>)
---Which tile map and layer to query is identified by the URL and the
---layer name parameters.
---@param url string | hash | url the tile map
---@param layer string | hash name of the layer for the tile
---@param x number x-coordinate of the tile
---@param y number y-coordinate of the tile
---@return tile number index of the tile
function tilemap.get_tile(url, layer, x, y) end
---Resets a shader constant for a tile map component.
---The constant must be defined in the material assigned to the tile map.
---Resetting a constant through this function implies that the value defined in the material will be used.
---Which tile map to reset a constant for is identified by the URL.
---@param url string | hash | url the tile map that should have a constant reset
---@param constant string | hash name of the constant
function tilemap.reset_constant(url, constant) end
---Sets a shader constant for a tile map component.
---The constant must be defined in the material assigned to the tile map.
---Setting a constant through this function will override the value set for that constant in the material.
---The value will be overridden until tilemap.reset_constant is called.
---Which tile map to set a constant for is identified by the URL.
---@param url string | hash | url the tile map that should have a constant set
---@param constant string | hash name of the constant
---@param value vector4 value of the constant
function tilemap.set_constant(url, constant, value) end
---Replace a tile in a tile map with a new tile.
---The coordinates of the tiles are indexed so that the "first" tile just
---above and to the right of origo has coordinates 1,1.
---Tiles to the left of and below origo are indexed 0, -1, -2 and so forth.
---
---+-------+-------+------+------+
---|  0,3  |  1,3  | 1,2  | 3,3  |
---+-------+-------+------+------+
---|  0,2  |  1,2  | 2,2  | 3,2  |
---+-------+-------+------+------+
---|  0,1  |  1,1  | 2,1  | 3,1  |
---+-------O-------+------+------+
---|  0,0  |  1,0  | 2,0  | 3,0  |
---+-------+-------+------+------+
---
---
---
---The coordinates must be within the bounds of the tile map as it were created.
---That is, it is not possible to extend the size of a tile map by setting tiles outside the edges.
---To clear a tile, set the tile to number 0. Which tile map and layer to manipulate is identified by the URL and the layer name parameters.
---@param url string | hash | url the tile map
---@param layer string | hash name of the layer for the tile
---@param x number x-coordinate of the tile
---@param y number y-coordinate of the tile
---@param tile number index of new tile to set
---@param h-flipped boolean optional if the tile should be horizontally flipped
---@param v-flipped boolean optional i the tile should be vertically flipped
function tilemap.set_tile(url, layer, x, y, tile, h-flipped, v-flipped) end

return tilemap