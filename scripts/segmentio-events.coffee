# Description:
#   Segment.io webhook integration that sends out an event for each notice received
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   donaldpiret

module.exports = (robot) ->
  robot.router.post '/hubot/segmentio-events', (req, res) ->
    console.log(req)
    console.log(res)
    console.log("Received post")
    console.log(req.body.payload)
    data   = JSON.parse req.body.payload
    console.log("Received event:")
    console.log(data)
    robot.emit 'event', data
