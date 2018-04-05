---Label API documentation
---Functions to manipulate a label component.
---@class label
local label = {}
---Gets the text metrics from a label component
---@param url string | hash | url the label to get the (unscaled) metrics from
---@return metrics table a table with the following fields:
function label.get_text_metrics(url) end
---Sets the text of a label component
---@param url string | hash | url the label that should have a constant set
---@param text string the text
function label.set_text(url, text) end

return label