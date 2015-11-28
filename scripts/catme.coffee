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

#token = "Client-ID #{process.env.HUBOT_IMGUR_CLIENTID}"
api_url = "https://api.imgur.com/3/gallery/r/CatGifs/0.json"

module.exports = (robot) ->
  robot.respond /cat me/i, (msg) ->
    msg.http(api_url).headers('Authorization': token).get() (err, res, body) ->
      if res.statusCode is 200
        data = JSON.parse(body)
        randomNum = Math.floor(Math.random() * data.data.length)
        msg.send "#{data.data[randomNum].link}"
      else
        console.error "imgur-info script error: #{api_url} returned #{res.statusCode}: #{body}"

  robot.respond /cat bomb( (\d+))?/i, (msg) ->
    max_cats = msg.match[2] || 5
    msg.http(api_url).headers('Authorization': token).get() (err, res, body) ->
      if res.statusCode is 200
        data = JSON.parse(body)
        for i in [1..max_cats]
          randomNum = Math.floor(Math.random() * data.data.length)
          msg.send "#{data.data[randomNum].link}"
      else
        console.error "imgur-info script error: #{api_url} returned #{res.statusCode}: #{body}"

  robot.respond /how many cats are there/i, (msg) ->
    msg.http(api_url).headers('Authorization': token).get() (err, res, body) ->
      if res.statusCode is 200
        data = JSON.parse(body)
        msg.send "There are #{data.data.length} cats."
      else
        console.error "imgur-info script error: #{api_url} returned #{res.statusCode}: #{body}"
