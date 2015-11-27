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
  "http://i.imgur.com/NXRSVri.jpg",
  "http://i.imgur.com/xWCDvJx.jpg",
  "http://i.imgur.com/GbhVwcm.gif",
  "http://i.imgur.com/NZF9y43.gif",
  "http://i.imgur.com/SlHhdPr.gif",
  "http://i.imgur.com/xhTF2aF.gif"
]

module.exports = (robot) ->
  robot.respond /cat me/i, (msg) ->
     msg.send msg.random cats

  robot.respond /cat bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    for i in [1..count]
      msg.send msg.random cats

  robot.respond /how many cats are there/i, (msg) ->
     msg.send "There are #{cats.length} cats."
