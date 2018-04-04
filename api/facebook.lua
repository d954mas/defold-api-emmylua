--Facebook API documentation
--Functions and constants for interacting with Facebook APIs.
---@class facebook
local facebook = {}
    facebook.AUDIENCE_EVERYONE = nil
    facebook.AUDIENCE_FRIENDS = nil
    facebook.AUDIENCE_NONE = nil
    facebook.AUDIENCE_ONLYME = nil
    facebook.EVENT_ADDED_PAYMENT_INFO = nil
    facebook.EVENT_ADDED_TO_CART = nil
    facebook.EVENT_ADDED_TO_WISHLIST = nil
    facebook.EVENT_COMPLETED_REGISTRATION = nil
    facebook.EVENT_COMPLETED_TUTORIAL = nil
    facebook.EVENT_INITIATED_CHECKOUT = nil
    facebook.EVENT_PURCHASED = nil
    facebook.EVENT_RATED = nil
    facebook.EVENT_SEARCHED = nil
    facebook.EVENT_SPENT_CREDITS = nil
    facebook.EVENT_TIME_BETWEEN_SESSIONS = nil
    facebook.EVENT_UNLOCKED_ACHIEVEMENT = nil
    facebook.EVENT_VIEWED_CONTENT = nil
    facebook.GAMEREQUEST_ACTIONTYPE_ASKFOR = nil
    facebook.GAMEREQUEST_ACTIONTYPE_NONE = nil
    facebook.GAMEREQUEST_ACTIONTYPE_SEND = nil
    facebook.GAMEREQUEST_ACTIONTYPE_TURN = nil
    facebook.GAMEREQUEST_FILTER_APPNONUSERS = nil
    facebook.GAMEREQUEST_FILTER_APPUSERS = nil
    facebook.GAMEREQUEST_FILTER_NONE = nil
    facebook.PARAM_CONTENT_ID = nil
    facebook.PARAM_CONTENT_TYPE = nil
    facebook.PARAM_CURRENCY = nil
    facebook.PARAM_DESCRIPTION = nil
    facebook.PARAM_LEVEL = nil
    facebook.PARAM_MAX_RATING_VALUE = nil
    facebook.PARAM_NUM_ITEMS = nil
    facebook.PARAM_PAYMENT_INFO_AVAILABLE = nil
    facebook.PARAM_REGISTRATION_METHOD = nil
    facebook.PARAM_SEARCH_STRING = nil
    facebook.PARAM_SOURCE_APPLICATION = nil
    facebook.PARAM_SUCCESS = nil
    facebook.STATE_CLOSED_LOGIN_FAILED = nil
    facebook.STATE_OPEN = nil
---This function returns the currently stored access token after a previous
---sucessful login. If it returns nil no access token exists and you need
---to perform a login to get the wanted permissions.
    function facebook.access_token() end
---This function will disable event usage for Facebook Analytics which means
---that Facebook won't be able to use event data for ad-tracking. Events will
---still be sent to Facebook for insights.
--- Event usage cannot be controlled and is always enabled for the
---Facebook Canvas platform, therefore this function has no effect on Facebook
---Canvas.
    function facebook.disable_event_usage() end
---This function will enable event usage for Facebook Analytics which means
---that Facebook will be able to use event data for ad-tracking.
--- Event usage cannot be controlled and is always enabled for the
---Facebook Canvas platform, therefore this function has no effect on Facebook
---Canvas.
    function facebook.enable_event_usage() end
---Login to Facebook and request a set of publish permissions. The user is
---prompted to authorize the application using the login dialog of the specific
---platform. Even if the user is already logged in to Facebook this function
---can still be used to request additional publish permissions.
--- Note that this function cannot be used to request read permissions.
---If the application requires both publish and read permissions, individual
---calls to both <a href="#login_with_publish_permissions">login_with_publish_permissions</a>
---and <a href="#login_with_read_permissions">login_with_read_permissions</a> has to be made.
---A comprehensive list of permissions can be found in the <a href="https://developers.facebook.com/docs/facebook-login/permissions">Facebook documentation</a>,
---as well as a <a href="https://developers.facebook.com/docs/facebook-login/best-practices">guide to best practises for login management</a>.
---@param permissions table Table with the requested publish permission strings.
---@param audience constant | number The audience that should be able to see the publications. <ul> facebook.AUDIENCE_NONE facebook.AUDIENCE_ONLYME facebook.AUDIENCE_FRIENDS facebook.AUDIENCE_EVERYONE </ul>
---@param callback function(self, data)|object|table Callback function that is executed when the permission request dialog is closed. <dl> <dt>self</dt> <dd> The context of the calling script</dd> <dt>data</dt> <dd> A table that contains the response</dd> </dl>
    function facebook.login_with_publish_permissions(permissions, audience, callback) end
---Login to Facebook and request a set of read permissions. The user is
---prompted to authorize the application using the login dialog of the specific
---platform. Even if the user is already logged in to Facebook this function
---can still be used to request additional read permissions.
--- Note that this function cannot be used to request publish permissions.
---If the application requires both read and publish permissions, individual
---calls to both <a href="#login_with_publish_permissions">login_with_publish_permissions</a>
---and <a href="#login_with_read_permissions">login_with_read_permissions</a> has to be made.
---A comprehensive list of permissions can be found in the <a href="https://developers.facebook.com/docs/facebook-login/permissions">Facebook documentation</a>,
---as well as a <a href="https://developers.facebook.com/docs/facebook-login/best-practices">guide to best practises for login management</a>.
---@param permissions table Table with the requested read permission strings.
---@param callback function(self, data)|object|table callback function that is executed when the permission request dialog is closed. <dl> <dt>self</dt> <dd> The context of the calling script</dd> <dt>data</dt> <dd> A table that contains the response</dd> </dl>
    function facebook.login_with_read_permissions(permissions, callback) end
---Logout from Facebook.
    function facebook.logout() end
---This function returns a table with all the currently granted permission strings.
    function facebook.permissions() end
---This function will post an event to Facebook Analytics where it can be used
---in the Facebook Insights system.
---@param event constant | string An event can either be one of the predefined constants below or a text string which can be used to define a custom event that is registered with Facebook Analytics. <ul> facebook.EVENT_ACHIEVED_LEVEL facebook.EVENT_ACTIVATED_APP facebook.EVENT_ADDED_PAYMENT_INFO facebook.EVENT_ADDED_TO_CART facebook.EVENT_ADDED_TO_WISHLIST facebook.EVENT_COMPLETED_REGISTRATION facebook.EVENT_COMPLETED_TUTORIAL facebook.EVENT_DEACTIVATED_APP facebook.EVENT_INITIATED_CHECKOUT facebook.EVENT_PURCHASED facebook.EVENT_RATED facebook.EVENT_SEARCHED facebook.EVENT_SESSION_INTERRUPTIONS facebook.EVENT_SPENT_CREDITS facebook.EVENT_TIME_BETWEEN_SESSIONS facebook.EVENT_UNLOCKED_ACHIEVEMENT facebook.EVENT_VIEWED_CONTENT </ul>
---@param value number a numeric value for the event. This should represent the value of the event, such as the level achieved, price for an item or number of orcs killed.
---@param [params] table optional table with parameters and their values. A key in the table can either be one of the predefined constants below or a text which can be used to define a custom parameter. <ul> facebook.PARAM_CONTENT_ID facebook.PARAM_CONTENT_TYPE facebook.PARAM_CURRENCY facebook.PARAM_DESCRIPTION facebook.PARAM_LEVEL facebook.PARAM_MAX_RATING_VALUE facebook.PARAM_NUM_ITEMS facebook.PARAM_PAYMENT_INFO_AVAILABLE facebook.PARAM_REGISTRATION_METHOD facebook.PARAM_SEARCH_STRING facebook.PARAM_SOURCE_APPLICATION facebook.PARAM_SUCCESS </ul>
    function facebook.post_event(event, value, params) end
---Display a Facebook web dialog of the type specified in the dialog parameter.
---The param table should be set up according to the requirements of each dialog
---type. Note that some parameters are mandatory. Below is the list of available dialogs and
---where to find Facebook's developer documentation on parameters and response data.
---<h3>"apprequests"</h3>
---Shows a Game Request dialog. Game Requests allows players to invite their friends to play a
---game. Available parameters:
---<ul>
---string title
---string message
---number action_type
---number filters
---string data
---string object_id
---table suggestions
---table recipients
---string to
---</ul>
---On success, the "result" table parameter passed to the callback function will include the following fields:
---<ul>
---string request_id
---table to
---</ul>
---Details for each parameter: <a href='https://developers.facebook.com/docs/games/services/gamerequests/v2.6#dialogparameters'>https://developers.facebook.com/docs/games/services/gamerequests/v2.6#dialogparameters</a>
---<h3>"feed"</h3>
---The Feed Dialog allows people to publish individual stories to their timeline.
---<ul>
---string caption
---string description
---string picture
---string link
---table people_ids
---string place_id
---string ref
---</ul>
---On success, the "result" table parameter passed to the callback function will include the following fields:
---<ul>
---string post_id
---</ul>
---Details for each parameter: <a href='https://developers.facebook.com/docs/sharing/reference/feed-dialog/v2.6#params'>https://developers.facebook.com/docs/sharing/reference/feed-dialog/v2.6#params</a>
---<h3>"appinvite"</h3>
---The App Invite dialog is available only on iOS and Android.
---Note that the url parameter
---corresponds to the appLinkURL (iOS) and setAppLinkUrl (Android) properties.
---<ul>
---string url
---string preview_image
---</ul>
---Details for each parameter: <a href='https://developers.facebook.com/docs/reference/ios/current/class/FBSDKAppInviteContent/'>https://developers.facebook.com/docs/reference/ios/current/class/FBSDKAppInviteContent/</a>
---@param dialog string dialog to show. - "apprequests" - "feed" - "appinvite"
---@param param table table with dialog parameters
---@param callback function(self, result, error)|object|table|table callback function that is called when the dialog is closed. <dl> <dt>self</dt> <dd> The context of the calling script</dd> <dt>result</dt> <dd> Table with dialog specific results. See above.</dd> <dt>error</dt> <dd> Error message. If there is no error, error is nil.</dd> </dl>
    function facebook.show_dialog(dialog, param, callback) end
return facebook