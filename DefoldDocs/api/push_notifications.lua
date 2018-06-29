---Push notifications API documentation
---Functions and constants for interacting with local, as well as
---Apple's and Google's push notification services. These API:s only exist on mobile platforms.
--- 
---@class push
local push = {}
---alert notification type
push.NOTIFICATION_ALERT = nil
---badge notification type
push.NOTIFICATION_BADGE = nil
---sound notification type
push.NOTIFICATION_SOUND = nil
---local push origin
push.ORIGIN_LOCAL = nil
---remote push origin
push.ORIGIN_REMOTE = nil
---remote push origin
push.ORIGIN_REMOTE = nil
---default notification priority 
push.PRIORITY_DEFAULT = nil
---higher notification priority 
push.PRIORITY_HIGH = nil
---lower notification priority 
push.PRIORITY_LOW = nil
---highest notification priority 
push.PRIORITY_MAX = nil
---lowest notification priority 
push.PRIORITY_MIN = nil
---Use this function to cancel a previously scheduled local push notification. The
---notification is identified by a numeric id as returned by push.schedule().
---@param id number the numeric id of the local push notification
function push.cancel(id) end
---Returns a table with all data associated with all scheduled local push notifications.
---The table contains key, value pairs where the key is the push notification id and the
---value is a table with the notification data, corresponding to the data given by
---push.get_scheduled(id).
---@return  table table with all data associated with all scheduled notifications
function push.get_all_scheduled() end
---Returns a table with all data associated with a specified local push notification.
---The notification is identified by a numeric id as returned by push.schedule().
---@param id number the numeric id of the local push notification
---@return  table table with all data associated with the notification
function push.get_scheduled(id) end
---Send a request for push notifications. Note that the notifications table parameter
---is iOS only and will be ignored on Android.
---@param notifications table the types of notifications to listen to. 
---@param callback function(self, token, error) register callback function.
function push.register(notifications, callback) end
---Local push notifications are scheduled with this function.
---The returned id value is uniquely identifying the scheduled notification
---and can be stored for later reference.
---@param time number number of seconds into the future until the notification should be triggered
---@param title string localized title to be displayed to the user if the application is not running
---@param alert string localized body message of the notification to be displayed to the user if the application is not running
---@param payload string JSON string to be passed to the registered listener function
---@param notification_settings table table with notification and platform specific fields
---@return  number unique id that can be used to cancel or inspect the notification
---@return  string error string if something went wrong, otherwise nil
function push.schedule(time, title, alert, payload, notification_settings) end
---Set the badge count for application icon.
---This function is only available on iOS. 
---@param count number badge count
function push.set_badge_count(count) end
---Sets a listener function to listen to push notifications.
---@param listener function(self, payload, origin, activated) listener callback function. Pass an empty function if you no longer wish to receive callbacks.
function push.set_listener(listener) end

return push