fs = require 'fs'
lysergix = require 'lysergix'

tags = ['angry', 'love', 'confused', 'crazy', 'smug', 'surprised', 'hurt', 'sad', 'dancing', 'laughing', 'giving up', 'running', 'other actions', 'evil', 'friends', 'meh']

module.exports = (filename) ->
  timeoutId = null
  makeFace = ->
    face = lysergix.getRandomFace(tags)
    newFace = """// #{face.description or face.tag}
    say \"#{face.content}\"\n"""
    fs.writeFile filename, newFace, (err) ->
      return console.log(err) if err
      timeoutId = setTimeout makeFace, 500
      return
  faceRunner =
    stop: -> clearTimeout timeoutId
    start: -> makeFace() unless timeoutId?
