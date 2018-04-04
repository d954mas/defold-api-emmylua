--In-app purchases API documentation
--Functions and constants for interacting with Apple's In-app purchases
--and Google's In-app billing.
---@class iap
local iap = {}
    iap.PROVIDER_ID_AMAZON = nil
    iap.PROVIDER_ID_APPLE = nil
    iap.PROVIDER_ID_FACEBOOK = nil
    iap.PROVIDER_ID_GAMEROOM = nil
    iap.PROVIDER_ID_GOOGLE = nil
    iap.REASON_UNSPECIFIED = nil
    iap.REASON_USER_CANCELED = nil
    iap.TRANS_STATE_FAILED = nil
    iap.TRANS_STATE_PURCHASED = nil
    iap.TRANS_STATE_PURCHASING = nil
    iap.TRANS_STATE_RESTORED = nil
    iap.TRANS_STATE_UNVERIFIED = nil
---Perform a product purchase.
--- Calling iap.finish() is required on a successful transaction if
---auto_finish_transactions is disabled in project settings.
---@param id string product to buy
---@param [options] table optional parameters as properties. The following parameters can be set: <ul> request_id ( Facebook only. Optional custom unique request id to set for this transaction. The id becomes attached to the payment within the Graph API.) </ul>
    function iap.buy(id, options) end
--- Performs a purchase of a premium game license. The purchase transaction
---is handled like regular iap purchases; calling the currently set iap_listener with the
---transaction results.
--- This function does not work when testing the application
---locally in the Gameroom client.
    function iap.buy_premium() end
---Explicitly finish a product transaction.
--- Calling iap.finish is required on a successful transaction
---if auto_finish_transactions is disabled in project settings. Calling this function
---with auto_finish_transactions set will be ignored and a warning is printed.
---The transaction.state field must equal iap.TRANS_STATE_PURCHASED.
---@param transaction table transaction table parameter as supplied in listener callback
    function iap.finish(transaction) end
    function iap.get_provider_id() end
--- Checks if a license for the game has been purchased by the user.
---You should provide a callback function that will be called with the result of the check.
--- This function does not work when testing the application
---locally in the Gameroom client.
---@param callback function(self, has_premium)|object|boolean result callback <dl> <dt>self</dt> <dd> The current object.</dd> <dt>has_premium</dt> <dd> true if the user has premium license, false otherwise.</dd> </dl>
    function iap.has_premium(callback) end
---Get a list of all avaliable iap products. Products are described as a table
---with the following fields:
---<dl>
---<dt>ident</dt>
---<dd>The product identifier.</dd>
---<dt>title</dt>
---<dd>The product title.</dd>
---<dt>description</dt>
---<dd>The product description.</dd>
---<dt>price</dt>
---<dd>The price of the product.</dd>
---<dt>price_string</dt>
---<dd>The price of the product, as a formatted string (amount and currency symbol).</dd>
---<dt>currency_code   </dt>
---<dd>The currency code. On Google Play, this reflects the merchant's locale, instead of the user's.</dd>
---</dl>
--- Nested calls, that is calling iap.list() from within the callback is
---not supported. Doing so will result in call being ignored with the engine reporting
---"Unexpected callback set".
---@param ids table table (array) of identifiers to get products from
---@param callback function(self, products, error)|object|table|table result callback <dl> <dt>self</dt> <dd> The current object.</dd> <dt>products</dt> <dd> Table describing the available iap products. See above for details.</dd> <dt>error</dt> <dd> a table containing error information. nil if there is no error. - error (the error message)</dd> </dl>
    function iap.list(ids, callback) end
---Restore previously purchased products.
    function iap.restore() end
---Set the callback function to receive purchase transaction events. Transactions are
---described as a table with the following fields:
---<dl>
---<dt>ident</dt>
---<dd>The product identifier.</dd>
---<dt>state</dt>
---<dd>The transaction state. See iap.TRANS_STATE_*.</dd>
---<dt>date</dt>
---<dd>The date and time for the transaction.</dd>
---<dt>trans_ident</dt>
---<dd>The transaction identifier. This field is only set when state is TRANS_STATE_RESTORED,
---TRANS_STATE_UNVERIFIED or TRANS_STATE_PURCHASED.</dd>
---<dt>receipt</dt>
---<dd>The transaction receipt. This field is only set when state is TRANS_STATE_PURCHASED
---or TRANS_STATE_UNVERIFIED.</dd>
---<dt>original_trans </dt>
---<dd>Apple only. The original transaction. This field is only set when state is
---TRANS_STATE_RESTORED.</dd>
---<dt>signature </dt>
---<dd>Google Play only. A string containing the signature of the purchase data that was signed
---with the private key of the developer.</dd>
---<dt>request_id </dt>
---<dd>Facebook only. This field is set to the optional custom unique request id request_id
---if set in the iap.buy() call parameters.</dd>
---<dt>purchase_token </dt>
---<dd>Facebook Gameroom only. The purchase token.</dd>
---<dt>currency </dt>
---<dd>Facebook Gameroom only. The currency used for the purchase.</dd>
---<dt>amount </dt>
---<dd>Facebook Gameroom only. The amount the player will be charged for a single unit
---of this product.</dd>
---<dt>quantity </dt>
---<dd>Facebook Gameroom only. The quantity of this item the user is purchasing.</dd>
---<dt>user_id </dt>
---<dd>Amazon Pay only. The user ID.</dd>
---<dt>is_sandbox_mode </dt>
---<dd>Amazon Pay only. If true, the SDK is running in Sandbox mode. This only allows
---interactions with the Amazon AppTester. Use this mode only for testing locally.</dd>
---<dt>cancel_date </dt>
---<dd>Amazon Pay only. The cancel date for the purchase. This field is only set if the
---purchase is canceled.</dd>
---<dt>canceled </dt>
---<dd>Amazon Pay only. Is set to true if the receipt was canceled or has expired;
---otherwise false.</dd>
---</dl>
---@param listener function(self, transaction, error)|object|table|table listener callback function. Pass an empty function if you no longer wish to receive callbacks. <dl> <dt>self</dt> <dd> The current object.</dd> <dt>transaction</dt> <dd> a table describing the transaction. See above for details.</dd> <dt>error</dt> <dd> a table containing error information. nil if there is no error. - error (the error message) - reason (the reason for the error, see iap.REASON_*)</dd> </dl>
    function iap.set_listener(listener) end
return iap