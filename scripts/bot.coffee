
child_process = require('child_process')
module.exports = (robot) ->

#Enunciado 1) Instalado
#Enunciado 2) Funcionando en grupo DevOps GF, canal #diplomado-devops
#Enunciado 3) 

 #R1
  robot.hear /encuesta/i, (res) ->
    res.send "Visita https://docs.google.com/forms/d/e/1FAIpQLSehGXVnS7v_tcUmFpioDYX5pRCfNqIDRckm7N_0yu-xzCLxhw/viewform?usp=sf_link"
 #R2
  robot.respond /time$/i, (msg) ->
    msg.send "La fecha es: #{new Date().toISOString()}"
 #R3
  robot.respond /hola bot/i, (msg) ->
    sender   = msg.message.user.name.toLowerCase()
    msg.send "Hola @#{sender}"
 #R4
  robot.respond /cuando termina el (.*)/i, (msg) ->
    resp = msg.match[1]
    msg.send "El #{resp.slice(0, -1).trim()} no va a terminar"
 #R5
  robot.hear /status/i, (res) ->
    res.send "Todos los sistemas corriendo :aaw_yeah:"
 #R6
  robot.respond /calendar( me)?/i, (msg) ->
    child_process.exec 'cal -h', (error, stdout, stderr) ->
      msg.send(stdout)
 #R7
  robot.respond /uname( me)?/i, (msg) ->
    child_process.exec 'uname -a', (error, stdout, stderr) ->
      msg.send(stdout)
 #R8
  robot.respond /uf( me)?/i, (msg) ->
    child_process.exec 'curl https://mindicador.cl/api/uf | jq', (error, stdout, stderr) ->
      msg.send(stdout)
 #R9
  robot.hear /sismos/i, (res) ->
    child_process.exec 'curl https://api.gael.cl/general/public/sismos | jq', (error, stdout, stderr) ->
      msg.send(stdout)
 #R10
  robot.hear /fuego/i, (res) ->
    res.send ":fire:"

#Enunciado 4) 
  respuestasSaludo = ['Hola', 'Como tai?', 'wena wena', 'holanda']
  respuestaDespedida = ['Bye', 'cya', '', 'los vimoh', 'chabela', 'chaopp']

  robot.hear /(.*)/i, (res) ->
    interaccion = res.match[1]
    if interaccion is "chao"
      res.send res.random respuestaDespedida
    if interaccion is "hola"
      res.send res.random respuestasSaludo

#Enunciado 5) 
  robot.hear /mensaje=(.*) a sala=(.*)/i, (res) ->
    message = res.match[1]
    room = res.match[2]
    robot.messageRoom room, message


#Enunciado 6) 
  roles = [
      {"nombre": "Nicolas", "cargo": "dev"},
      {"nombre": "Gerardo", "cargo": "PM"},
      {"nombre": "Cristian", "cargo": "TL"},
      {"nombre": "Mauricio", "cargo": "CTO"}
  ]
  robot.hear /quien es el (.*)/i, (msg) ->
    rol = msg.match[1]
    myMap = {}
    for row in roles
      myMap[row.cargo] = row.nombre
    find = myMap[rol]
    if find
      msg.send "El #{rol} es #{find}"
    else
      msg.send "No encontre la persona con el rol #{rol}"

#Segundo Enunciado 2) 
  diccionario = [   { name: "stakeholder", define: "Público interesado en un proyecto" },
                    { name: "jenkins", define: "Jenkins es un servidor de automatización open source escrito en Java" },
                    { name: "pipeline", define: "Serie de procesos de automatización" },
                    { name: "azure", define: "Es la plataforma cloud de Microsoft" },
                    { name: "devops", define: "Una nueva raza de superhumanos" },
                    { name: "sre", define: "Site Reliability Engineering" },
                    { name: "kpi", define: "Es una medida del nivel del rendimiento de un proceso" },
                    { name: "kanban", define: "Es un sistema de información que controla de modo armónico la fabricación de los productos necesarios en la cantidad y tiempo necesarios en cada uno de los procesos que tienen lugar tanto en el interior de la fábrica, como entre distintas empresas" },
                    { name: "lean", define: "Filosofía de gestión basada en las prácticas del Toyota Production System" },
                    { name: "grafana", define: "Grafana es un software libre basado en licencia de Apache 2.0, ​ que permite la visualización y el formato de datos métricos." }]

  robot.hear /define (.*)/i, (res) ->
    item = diccionario.filter (x) -> x.name == res.match[1].toLowerCase().trim()
    res.send  "#{item[0].define}"


   #R9
  robot.hear /avg1/i, (msg) ->
    child_process.exec 'sh avg1.sh', (error, stdout, stderr) ->
      msg.send(stdout)

     #R9
  robot.hear /avg2/i, (msg) ->
    child_process.exec 'sh avg2.sh', (error, stdout, stderr) ->
      msg.send(stdout)

   #R9
  robot.hear /avg3/i, (msg) ->
    child_process.exec 'sh avg3.sh', (error, stdout, stderr) ->
      msg.send(stdout)