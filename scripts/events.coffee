# Description:
#   Event system related utilities
#
# Commands:
#   hubot fake event <event> - Triggers the <event> event for debugging reasons
#
# Events:
#   debug - {user: <user object to send message to>}

util = require 'util'

module.exports = (robot) ->

  robot.respond /FAKE EVENT '([^']+)' with data (.*)$/i, (msg) ->
    data   = JSON.parse(msg.match[2])
    msg.send "fake event '#{msg.match[1]}' triggered with data: '#{data}'"
    robot.emit msg.match[1], data

  robot.respond /FAKE EVENT (.*)/i, (msg) ->
    msg.send "fake event '#{msg.match[1]}' triggered"
    robot.emit msg.match[1], {user: msg.message.user}

  robot.on 'debug', (event) ->
    robot.send event.user, util.inspect event