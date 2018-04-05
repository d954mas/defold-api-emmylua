---Facebook API documentation
---Functions and constants for interacting with Facebook APIs.
---@class facebook
local facebook = {}
---publish permission to reach everyone
facebook.AUDIENCE_EVERYONE = nil
---publish permission to reach user friends
facebook.AUDIENCE_FRIENDS = nil
---publish permission to reach no audience
facebook.AUDIENCE_NONE = nil
---publish permission to reach only me (private to current user)
facebook.AUDIENCE_ONLYME = nil
---log this event when the user has entered their payment info
facebook.EVENT_ADDED_PAYMENT_INFO = nil
---log this event when the user has added an item to their cart
facebook.EVENT_ADDED_TO_CART = nil
---log this event when the user has added an item to their wish list
facebook.EVENT_ADDED_TO_WISHLIST = nil
---log this event when a user has completed registration with the app
facebook.EVENT_COMPLETED_REGISTRATION = nil
---log this event when the user has completed a tutorial in the app
facebook.EVENT_COMPLETED_TUTORIAL = nil
---log this event when the user has entered the checkout process
facebook.EVENT_INITIATED_CHECKOUT = nil
---Log this event when the user has completed a purchase.
facebook.EVENT_PURCHASED = nil
---log this event when the user has rated an item in the app
facebook.EVENT_RATED = nil
---log this event when a user has performed a search within the app
facebook.EVENT_SEARCHED = nil
---log this event when the user has spent app credits
facebook.EVENT_SPENT_CREDITS = nil
---log this event when measuring the time between user sessions
facebook.EVENT_TIME_BETWEEN_SESSIONS = nil
---log this event when the user has unlocked an achievement in the app
facebook.EVENT_UNLOCKED_ACHIEVEMENT = nil
---log this event when a user has viewed a form of content in the app
facebook.EVENT_VIEWED_CONTENT = nil
---game request action type "askfor" for "apprequests" dialog
facebook.GAMEREQUEST_ACTIONTYPE_ASKFOR = nil
---game request action type "none" for "apprequests" dialog
facebook.GAMEREQUEST_ACTIONTYPE_NONE = nil
---game request action type "send" for "apprequests" dialog
facebook.GAMEREQUEST_ACTIONTYPE_SEND = nil
---game request action type "turn" for "apprequests" dialog
facebook.GAMEREQUEST_ACTIONTYPE_TURN = nil
---game request filter type "app_non_users" for "apprequests" dialog
facebook.GAMEREQUEST_FILTER_APPNONUSERS = nil
---game request filter type "app_users" for "apprequests" dialog
facebook.GAMEREQUEST_FILTER_APPUSERS = nil
---game request filter type "none" for "apprequests" dialog
facebook.GAMEREQUEST_FILTER_NONE = nil
---parameter key used to specify an ID for the content being logged about
facebook.PARAM_CONTENT_ID = nil
---parameter key used to specify a generic content type/family for the logged event
facebook.PARAM_CONTENT_TYPE = nil
---parameter key used to specify currency used with logged event
facebook.PARAM_CURRENCY = nil
---parameter key used to specify a description appropriate to the event being logged
facebook.PARAM_DESCRIPTION = nil
---parameter key used to specify the level achieved
facebook.PARAM_LEVEL = nil
---parameter key used to specify the maximum rating available
facebook.PARAM_MAX_RATING_VALUE = nil
---parameter key used to specify how many items are being processed
facebook.PARAM_NUM_ITEMS = nil
---parameter key used to specify whether payment info is available
facebook.PARAM_PAYMENT_INFO_AVAILABLE = nil
---parameter key used to specify method user has used to register for the app
facebook.PARAM_REGISTRATION_METHOD = nil
---parameter key used to specify user search string
facebook.PARAM_SEARCH_STRING = nil
---parameter key used to specify source application package
facebook.PARAM_SOURCE_APPLICATION = nil
---parameter key used to specify activity success
facebook.PARAM_SUCCESS = nil
---the Facebook login session has closed because login failed
facebook.STATE_CLOSED_LOGIN_FAILED = nil
---the Facebook login session is open
facebook.STATE_OPEN = nil
---This function returns the currently stored access token after a previous
---sucessful login. If it returns nil no access token exists and you need
---to perform a login to get the wanted permissions.
---@return token string the access token or nil if the user is not logged in
function facebook.access_token() end
---This function will disable event usage for Facebook Analytics which means
---that Facebook won't be able to use event data for ad-tracking. Events will
---still be sent to Facebook for insights.
---
--- Event usage cannot be controlled and is always enabled for the
---Facebook Canvas platform, therefore this function has no effect on Facebook
---Canvas.
function facebook.disable_event_usage() end
---This function will enable event usage for Facebook Analytics which means
---that Facebook will be able to use event data for ad-tracking.
---
--- Event usage cannot be controlled and is always enabled for the
---Facebook Canvas platform, therefore this function has no effect on Facebook
---Canvas.
function facebook.enable_event_usage() end
---Login to Facebook and request a set of publish permissions. The user is
---prompted to authorize the application using the login dialog of the specific
---platform. Even if the user is already logged in to Facebook this function
---can still be used to request additional publish permissions.
---
--- Note that this function cannot be used to request read permissions.
---If the application requires both publish and read permissions, individual
---calls to both login_with_publish_permissions <>
---and login_with_read_permissions <> has to be made.
---
---A comprehensive list of permissions can be found in the Facebook documentation <https://developers.facebook.com/docs/facebook-login/permissions>,
---as well as a guide to best practises for login management <https://developers.facebook.com/docs/facebook-login/best-practices>.
---@param permissions table Table with the requested publish permission strings.
---@param audience constant | number The audience that should be able to see the publications.
---@param callback function(self, data) Callback function that is executed when the permission request dialog is closed.
function facebook.login_with_publish_permissions(permissions, audience, callback) end
---Login to Facebook and request a set of read permissions. The user is
---prompted to authorize the application using the login dialog of the specific
---platform. Even if the user is already logged in to Facebook this function
---can still be used to request additional read permissions.
---
--- Note that this function cannot be used to request publish permissions.
---If the application requires both read and publish permissions, individual
---calls to both login_with_publish_permissions <>
---and login_with_read_permissions <> has to be made.
---
---A comprehensive list of permissions can be found in the Facebook documentation <https://developers.facebook.com/docs/facebook-login/permissions>,
---as well as a guide to best practises for login management <https://developers.facebook.com/docs/facebook-login/best-practices>.
---@param permissions table Table with the requested read permission strings.
---@param callback function(self, data) callback function that is executed when the permission request dialog is closed.
function facebook.login_with_read_permissions(permissions, callback) end
---Logout from Facebook.
function facebook.logout() end
---This function returns a table with all the currently granted permission strings.
---@return permissions table the permissions
function facebook.permissions() end
---This function will post an event to Facebook Analytics where it can be used
---in the Facebook Insights system.
---@param event constant | string An event can either be one of the predefined constants below or a text string which can be used to define a custom event that is registered with Facebook Analytics.
---@param value number a numeric value for the event. This should represent the value of the event, such as the level achieved, price for an item or number of orcs killed.
---@param params table optional table with parameters and their values. A key in the table can either be one of the predefined constants below or a text which can be used to define a custom parameter.
function facebook.post_event(event, value, params) end
---Display a Facebook web dialog of the type specified in the dialog parameter.
---The param table should be set up according to the requirements of each dialog
---type. Note that some parameters are mandatory. Below is the list of available dialogs and
---where to find Facebook's developer documentation on parameters and response data.
---
---"apprequests"
---
---Shows a Game Request dialog. Game Requests allows players to invite their friends to play a
---game. Available parameters:
---
---
--- * string title
---
--- * string message
---
--- * number action_type
---
--- * number filters
---
--- * string data
---
--- * string object_id
---
--- * table suggestions
---
--- * table recipients
---
--- * string to
---
---
---On success, the "result" table parameter passed to the callback function will include the following fields:
---
---
--- * string request_id
---
--- * table to
---
---
---Details for each parameter: https://developers.facebook.com/docs/games/services/gamerequests/v2.6#dialogparameters <https://developers.facebook.com/docs/games/services/gamerequests/v2.6#dialogparameters>
---
---"feed"
---
---The Feed Dialog allows people to publish individual stories to their timeline.
---
---
--- * string caption
---
--- * string description
---
--- * string picture
---
--- * string link
---
--- * table people_ids
---
--- * string place_id
---
--- * string ref
---
---
---On success, the "result" table parameter passed to the callback function will include the following fields:
---
---
--- * string post_id
---
---
---Details for each parameter: https://developers.facebook.com/docs/sharing/reference/feed-dialog/v2.6#params <https://developers.facebook.com/docs/sharing/reference/feed-dialog/v2.6#params>
---
---"appinvite"
---
---The App Invite dialog is available only on iOS and Android.
---Note that the url parameter
---corresponds to the appLinkURL (iOS) and setAppLinkUrl (Android) properties.
---
---
--- * string url
---
--- * string preview_image
---
---
---Details for each parameter: https://developers.facebook.com/docs/reference/ios/current/class/FBSDKAppInviteContent/ <https://developers.facebook.com/docs/reference/ios/current/class/FBSDKAppInviteContent/>
---@param dialog string dialog to show. - 
---@param param table table with dialog parameters
---@param callback function(self, result, error) callback function that is called when the dialog is closed.
function facebook.show_dialog(dialog, param, callback) end

return facebook