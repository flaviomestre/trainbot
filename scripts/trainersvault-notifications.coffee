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
    if new RegExp(/Payment collected for order/i).test(data.event)
      orderId = data.properties.orderId
      revenue = data.properties.revenue
      message = "KACHING!!! Payment collected for order ##{orderId}: #{revenue}$"
      if rooms and rooms.length > 0
        for room in rooms
          robot.messageRoom(room, message)
    if new RegExp(/Account activated/i).test(data.event)
      userId = data.properties.id
      userEmail = data.properties.email
      message = "New user signup: #{userId} - #{userEmail}"
      if rooms and rooms.length > 0
        for room in rooms
          robot.messageRoom(room, message)
