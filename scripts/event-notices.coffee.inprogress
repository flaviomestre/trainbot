## Description:
##   Listen to incoming events and send out messages to the room or to individual users when an event name matches
##
## Dependencies:
##   None
##
## Configuration:
##   None
##
## Commands:
##   hubot notify us of <event> with <message> - Associate a certain message to the room with an event
##   hubot notify me of <event> with <message> - Associate a certain message to a user with an event
##   hubot show event notifications - Lists all currently associated events
##   hubot stop notifying me when <event> - Clear all actions associated with a certain event
##   hubot stop notifying us when <event> - Clear all actions associated with a certain event
##   hubot stop notifying - Clear all actions associated with events
##
## Author:
##   donaldpiret
#
#class EventNotices
#  constructor: (@robot) ->
#    @cache = []
#    @robot.brain.on 'loaded', =>
#      if @robot.brain.data.eventnotices
#        @cache = @robot.brain.data.eventnotices
#  addToRoom: (pattern, message, room) ->
#    task = {key: pattern, message: message, room: room}
#    @cache.push task
#    @robot.brain.data.eventnotices = @cache
#  addToUser: (pattern, message, user) ->
#    task = {key: pattern, message: message, user: user}
#    @cache.push task
#    @robot.brain.data.eventnotices = @cache
#  all: -> @cache
#  deleteByPattern: (pattern) ->
#    @cache = @cache.filter (n) -> n.key != pattern
#    @robot.brain.data.eventnotices = @cache
#  deleteByPatternForUser: (pattern, user) ->
#    @cache = @cache.filter (n) -> n.key != pattern || n.user != user
#    @robot.brain.data.eventnotices = @cache
#  deleteByPatternForRoom: (pattern, room) ->
#    @cache = @cache.filter (n) -> n.key != pattern || n.room != room
#    @robot.brain.data.eventnotices = @cache
#  deleteAll: () ->
#    @cache = []
#    @robot.brain.data.eventnotices = @cache
#
#module.exports = (robot) ->
#  eventNotices = new EventNotices robot
#
#  robot.respond /notify us of (.+?) with (.+?)$/i, (msg) ->
#    event = msg.match[1]
#    message = msg.match[2]
#    room = msg.message.user.room
#    eventNotices.addToRoom(event, message, room)
#    msg.send "I will now let you know when #{event} happens!"
#
#  robot.respond /notify me of (.+?) with (.+?)$/i, (msg) ->
#    eventName = msg.match[1]
#    message = msg.match[2]
#    user = msg.message.user
#    eventNotices.addToUser(eventName, message, user)
#    msg.send "I will now let #{user.name} know when #{eventName} happens!"
#
#  robot.respond /show event notifications$/i, (msg) ->
#    unless eventNotices.all().length > 0
#      msg.send "No notifications set up"
#    for notice in eventNotices.all()
#      pattern = notice.pattern
#      message = notice.message
#      if notice.room
#        room = notice.room
#        msg.send "I will notify the room #{room} when #{pattern} happens with message #{message}"
#      if notice.user
#        user = notice.user
#        msg.send "I will notify #{user.name} when #{pattern} happens with message #{message}"
#
#  robot.respond /stop notifying me when (.+?)$/i, (msg) ->
#    event = msg.match[1]
#    user = msg.message.user
#    eventNotices.deleteByPatternForUser(event, user)
#
#  robot.respond /stop notifying us when (.+?)$/i, (msg) ->
#    event = msg.match[1]
#    room = msg.message.user.room
#    eventNotices.deleteByPatternForRoom(event, room)
#
#  robot.respond /stop notifying$/i, (msg) ->
#    eventNotices.deleteAll()
#    msg.send "Fine, I'll shut up now..."
#
#  robot.on 'event', (event) ->
#    for notice in eventNotices.all()
#      if new RegExp(notice.key, "i").test(event.event)
#        if notice.room
#          robot.messageRoom(notice.room, notice.message)
#        if notice.user
#          robot.send(notice.user, notice.message)