# Description:
#   Notifications to Trainersvault
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_TRAINERSVAULT_NOTIFICATIONS_ROOMS - A comma separate list of rooms to send notifications to
#
# Commands:
#   None
#
# Author:
#   donaldpiret

module.exports = (robot) ->
  if process.env.HUBOT_TRAINERSVAULT_NOTIFICATION_ROOMS
    rooms = process.env.HUBOT_TRAINERSVAULT_NOTIFICATION_ROOMS.split(",")

  robot.on 'event', (data) ->
    if new RegExp(/Paid for order/i).test(data.event)
      orderTotal = data.properties.orderTotal
      message = "KACHING!!! New order of: #{orderTotal}"
      if rooms and rooms.length > 0
        for room in rooms
          robot.messageRoom(room, message)
