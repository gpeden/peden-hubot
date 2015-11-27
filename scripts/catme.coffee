# Description:
#   Catme is the most important thing in life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cat me - Receive a cat
#   hubot cat bomb N - get N cat

module.exports = (robot) ->
  robot.respond /cat me/i, (msg) ->
     msg.send "Don't worry, real Cats coming soon!"

  #robot.respond /cat me/i, (msg) ->
  #  msg.http("http://Catme.herokuapp.com/random")
  #    .get() (err, res, body) ->
  #      msg.send JSON.parse(body).pug

  #robot.respond /pug bomb( (\d+))?/i, (msg) ->
  #  count = msg.match[2] || 5
  #  msg.http("http://Catme.herokuapp.com/bomb?count=" + count)
  #    .get() (err, res, body) ->
  #      msg.send pug for pug in JSON.parse(body).pugs

  #robot.respond /how many pugs are there/i, (msg) ->
  #  msg.http("http://Catme.herokuapp.com/count")
  #    .get() (err, res, body) ->
  #      msg.send "There are #{JSON.parse(body).pug_count} pugs."
