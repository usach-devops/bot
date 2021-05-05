# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

 #1
  robot.hear /encuesta/i, (res) ->
    res.send "Visita https://docs.google.com/forms/d/e/1FAIpQLSehGXVnS7v_tcUmFpioDYX5pRCfNqIDRckm7N_0yu-xzCLxhw/viewform?usp=sf_link"

 #2
  robot.respond /time$/i, (msg) ->
    msg.send "La fecha es: #{new Date()}"

 #3
  robot.respond /hola bot/i, (msg) ->
    sender   = msg.message.user.name.toLowerCase()
    msg.send "Hola @#{sender}"

 #4
  robot.respond /cuando termina el (.*)/i, (msg) ->
    resp = msg.match[1]
    msg.send "El #{resp.slice(0, -1).trim()} no va a terminar"

 #5
  robot.hear /status/i, (res) ->
    res.send "Todos los sistemas UP :aaw_yeah:"

  robot.router.post '/hubot/notify/:room', (req, res) ->
    room = req.params.room
    message = req.body.message
    robot.messageRoom room, message
    res.end()

 #6
  respuestasSaludo = ['Hola', 'Como tai?', 'wena wena', 'holanda']
  respuestaDespedida = ['Bye', 'cya', '', 'los vimoh', 'chabela', 'chaopp']

  robot.hear /(.*)/i, (res) ->
    interaccion = res.match[1]
    if interaccion is "chao"
      res.send res.random respuestaDespedida
    if interaccion is "hola"
      res.send res.random respuestasSaludo

    



  