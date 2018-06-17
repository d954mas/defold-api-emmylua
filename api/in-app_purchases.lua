---In-app purchases API documentation
---Functions and constants for interacting with Apple's In-app purchases
---and Google's In-app billing.
---@class iap
local iap = {}
---provider id for Amazon
iap.PROVIDER_ID_AMAZON = nil
---provider id for Apple
iap.PROVIDER_ID_APPLE = nil
---provider id for Facebook
iap.PROVIDER_ID_FACEBOOK = nil
---provider id for Facebook Gameroom
iap.PROVIDER_ID_GAMEROOM = nil
---iap provider id for Google
iap.PROVIDER_ID_GOOGLE = nil
---unspecified error reason
iap.REASON_UNSPECIFIED = nil
---user canceled reason
iap.REASON_USER_CANCELED = nil
---transaction failed state
iap.TRANS_STATE_FAILED = nil
---transaction purchased state
iap.TRANS_STATE_PURCHASED = nil
---transaction purchasing state
iap.TRANS_STATE_PURCHASING = nil
---transaction restored state
iap.TRANS_STATE_RESTORED = nil
---transaction unverified state, requires verification of purchase
iap.TRANS_STATE_UNVERIFIED = nil
---Perform a product purchase.
---
--- Calling iap.finish() is required on a successful transaction if
---auto_finish_transactions is disabled in project settings.
---@param id string product to buy
---@param options table optional parameters as properties. The following parameters can be set:
function iap.buy(id, options) end
--- Performs a purchase of a premium game license. The purchase transaction
---is handled like regular iap purchases; calling the currently set iap_listener with the
---transaction results.
---
--- This function does not work when testing the application
---locally in the Gameroom client.
function iap.buy_premium() end
---Explicitly finish a product transaction.
---
--- Calling iap.finish is required on a successful transaction
---if auto_finish_transactions is disabled in project settings. Calling this function
---with auto_finish_transactions set will be ignored and a warning is printed.
---The transaction.state field must equal iap.TRANS_STATE_PURCHASED.
---@param transaction table transaction table parameter as supplied in listener callback
function iap.finish(transaction) end
---@return  constant provider id.
function iap.get_provider_id() end
--- Checks if a license for the game has been purchased by the user.
---You should provide a callback function that will be called with the result of the check.
---
--- This function does not work when testing the application
---locally in the Gameroom client.
---@param callback function(self, has_premium) result callback
function iap.has_premium(callback) end
---Get a list of all avaliable iap products. Products are described as a table
---with the following fields:
---
---  ident
---The product identifier.
---  title
---The product title.
---  description
---The product description.
---  price
---The price of the product.
---  price_string
---The price of the product, as a formatted string (amount and currency symbol).
---  currency_code 
---The currency code. On Google Play, this reflects the merchant's locale, instead of the user's.
---
---
--- Nested calls, that is calling iap.list() from within the callback is
---not supported. Doing so will result in call being ignored with the engine reporting
---"Unexpected callback set".
---@param ids table table (array) of identifiers to get products from
---@param callback function(self, products, error) result callback
function iap.list(ids, callback) end
---Restore previously purchased products.
---@return  boolean 
function iap.restore() end
---Set the callback function to receive purchase transaction events. Transactions are
---described as a table with the following fields:
---
---  ident
---The product identifier.
---  state
---The transaction state. See iap.TRANS_STATE_*.
---  date
---The date and time for the transaction.
---  trans_ident
---The transaction identifier. This field is only set when state is TRANS_STATE_RESTORED,
---TRANS_STATE_UNVERIFIED or TRANS_STATE_PURCHASED.
---  receipt
---The transaction receipt. This field is only set when state is TRANS_STATE_PURCHASED
---or TRANS_STATE_UNVERIFIED.
---  original_trans 
---Apple only. The original transaction. This field is only set when state is
---TRANS_STATE_RESTORED.
---  signature 
---Google Play only. A string containing the signature of the purchase data that was signed
---with the private key of the developer.
---  request_id 
---Facebook only. This field is set to the optional custom unique request id request_id
---if set in the iap.buy() call parameters.
---  purchase_token 
---Facebook Gameroom only. The purchase token.
---  currency 
---Facebook Gameroom only. The currency used for the purchase.
---  amount 
---Facebook Gameroom only. The amount the player will be charged for a single unit
---of this product.
---  quantity 
---Facebook Gameroom only. The quantity of this item the user is purchasing.
---  user_id 
---Amazon Pay only. The user ID.
---  is_sandbox_mode 
---Amazon Pay only. If true, the SDK is running in Sandbox mode. This only allows
---interactions with the Amazon AppTester. Use this mode only for testing locally.
---  cancel_date 
---Amazon Pay only. The cancel date for the purchase. This field is only set if the
---purchase is canceled.
---  canceled 
---Amazon Pay only. Is set to true if the receipt was canceled or has expired;
---otherwise false.

---@param listener function(self, transaction, error) listener callback function. Pass an empty function if you no longer wish to receive callbacks.
function iap.set_listener(listener) end

return iap