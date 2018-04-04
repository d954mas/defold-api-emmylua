--Label API documentation
--Functions to manipulate a label component.
---@class label
local label = {}
---Gets the text metrics from a label component
---@param url string | hash | url the label to get the (unscaled) metrics from
---@return table a table with the following fields: <ul> width height max_ascent max_descent </ul> function init(self)     local metrics = label.get_text_metrics(&quot;#label&quot;)     pprint(metrics) end 
    function label.get_text_metrics(url) end
---Sets the text of a label component
---@param url string | hash | url the label that should have a constant set
---@param text string the text
    function label.set_text(url, text) end
return label