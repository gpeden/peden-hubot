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
#   hubot how many cats are there - return count of cats

# static list of cat images

cats = [
  'http://i.imgur.com/NXRSVri.jpg',
  'http://i.imgur.com/xWCDvJx.jpg',
  'http://i.imgur.com/GbhVwcm.gif',
]

module.exports = (robot) ->
  # return a single cat image
  robot.respond /cat me/i, (msg) ->
     msg.send msg.random cats

  #
  robot.respond /how many cats are there/i, (msg) ->
     msg.send "There are #{cats.length} cats."

  robot.respond /cat bomb( (\d+))?/i, (msg) ->
        msg.send cat for cat in cats

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
