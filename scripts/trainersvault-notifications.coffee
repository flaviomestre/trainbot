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
    #console.log(data)
    if new RegExp(/Payment collected for order/i).test(data.event)
      #console.log(data.properties)
      orderId = data.properties.orderId
      revenue = data.properties.revenue
      trainer = data.properties.trainer
      user = data.properties.userName
      message = "KACHING!!! #{user} booked #{trainer}: $#{revenue} (Order ##{orderId})"
      if rooms and rooms.length > 0
        for room in rooms
          robot.messageRoom(room, message)
    if new RegExp(/Account activated/i).test(data.event)
      userId = data.properties.id
      userName = "#{data.properties.firstName} #{data.properties.lastName}"
      userEmail = data.properties.email
      message = "New user #{userName} (#{userEmail})"
      if rooms and rooms.length > 0
        for room in rooms
          robot.messageRoom(room, message)
