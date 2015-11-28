# Description:
#   Catme is the most important thing in life
#
# Dependencies:
#   None
#
# Configuration:
# You'll need to generate a Client-ID at:
#       https://api.imgur.com/oauth2/addclient
#
# If you are using heroku, you will need set HUBOT_IMGUR_CLIENTID in the Settings:Config Vars section.
token = "Client-ID #{process.env.HUBOT_IMGUR_CLIENTID}"

#
# Commands:
#   hubot cat me - Receive a cat
#   hubot cat bomb N - get N cat
#   hubot how many cats are there - return count of cats

api_url = "https://api.imgur.com/3/gallery/r/CatGifs/0.json"

module.exports = (robot) ->
  robot.respond /cat me/i, (msg) ->
    msg.http(api_url).headers('Authorization': token).get() (err, res, body) ->
      if res.statusCode is 200
        data = JSON.parse(body)
        randomNum = Math.floor(Math.random() * data.data.length)
        msg.send "#{data.data[randomNum].link}"
      else
        console.error "cat me script error: #{api_url} returned #{res.statusCode}: #{body}"

  robot.respond /cat bomb( (\d+))?/i, (msg) ->
    max_cats = msg.match[2] || 5
    msg.http(api_url).headers('Authorization': token).get() (err, res, body) ->
      if res.statusCode is 200
        data = JSON.parse(body)
        for i in [1..max_cats]
          randomNum = Math.floor(Math.random() * data.data.length)
          msg.send "#{data.data[randomNum].link}"
      else
        console.error "cat me script error: #{api_url} returned #{res.statusCode}: #{body}"

  robot.respond /how many cats are there/i, (msg) ->
    msg.http(api_url).headers('Authorization': token).get() (err, res, body) ->
      if res.statusCode is 200
        data = JSON.parse(body)
        msg.send "There are #{data.data.length} cats."
      else
        console.error "cat me script error: #{api_url} returned #{res.statusCode}: #{body}"
