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
    data = req.body
    robot.emit 'event', data
    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end 'OK\n'
