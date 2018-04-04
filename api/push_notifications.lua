--Push notifications API documentation
--Functions and constants for interacting with local, as well as
--Apple's and Google's push notification services. These API:s only exist on mobile platforms.
-- 
---@class push
local push = {}
    push.NOTIFICATION_ALERT = nil
    push.NOTIFICATION_BADGE = nil
    push.NOTIFICATION_SOUND = nil
    push.ORIGIN_LOCAL = nil
    push.ORIGIN_REMOTE = nil
    push.PRIORITY_DEFAULT = nil
    push.PRIORITY_HIGH = nil
    push.PRIORITY_LOW = nil
    push.PRIORITY_MAX = nil
    push.PRIORITY_MIN = nil
---Use this function to cancel a previously scheduled local push notification. The
---notification is identified by a numeric id as returned by push.schedule().
---@param id number the numeric id of the local push notification
    function push.cancel(id) end
---Returns a table with all data associated with all scheduled local push notifications.
---The table contains key, value pairs where the key is the push notification id and the
---value is a table with the notification data, corresponding to the data given by
---push.get_scheduled(id).
    function push.get_all_scheduled() end
---Returns a table with all data associated with a specified local push notification.
---The notification is identified by a numeric id as returned by push.schedule().
---@param id number the numeric id of the local push notification
---@return table table with all data associated with the notification
    function push.get_scheduled(id) end
---Send a request for push notifications. Note that the notifications table parameter
---is iOS only and will be ignored on Android.
---@param notifications table the types of notifications to listen to. 
---@param callback function(self, token, error)|object|string|table register callback function. <dl> <dt>self</dt> <dd>  The current object. </dd> <dt>token</dt> <dd>  The returned push token if registration is successful. </dd> <dt>error</dt> <dd>  A table containing eventual error information. </dd> </dl>
    function push.register(notifications, callback) end
---Local push notifications are scheduled with this function.
---The returned id value is uniquely identifying the scheduled notification
---and can be stored for later reference.
---@param time number number of seconds into the future until the notification should be triggered
---@param title string localized title to be displayed to the user if the application is not running
---@param alert string localized body message of the notification to be displayed to the user if the application is not running
---@param payload string JSON string to be passed to the registered listener function
---@param notification_settings table|string|number|number table with notification and platform specific fields <dl> <dt>action </dt> <dd>  The alert action string to be used as the title of the right button of the  alert or the value of the unlock slider, where the value replaces  "unlock" in "slide to unlock" text.</dd> <dt>badge_count </dt> <dd> The numeric value of the icon badge.</dd> <dt><s>badge_number</s></dt> <dd>Deprecated! Use badge_count instead</dd> <dt>priority </dt> <dd>  The priority is a hint to the device UI about how the notification  should be displayed. There are five priority levels, from -2 to 2 where -1 is the  lowest priority and 2 the highest. Unless specified, a default priority level of 2  is used.</dd> </dl>
---@return number unique id that can be used to cancel or inspect the notification
---@return string error string if something went wrong, otherwise nil
    function push.schedule(time, title, alert, payload, notification_settings) end
---Set the badge count for application icon.
---This function is only available on iOS. 
---@param count number badge count
    function push.set_badge_count(count) end
---Sets a listener function to listen to push notifications.
---@param listener function(self, payload, origin, activated)|object|function|constant|boolean listener callback function. Pass an empty function if you no longer wish to receive callbacks. <dl> <dt>self</dt> <dd> The current object</dd> <dt>payload</dt> <dd> the push payload</dd> <dt>origin</dt> <dd> push.ORIGIN_LOCAL or push.ORIGIN_REMOTE</dd> <dt>activated</dt> <dd> true or false depending on if the application was  activated via the notification.</dd> </dl>
    function push.set_listener(listener) end
return push