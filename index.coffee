fs = require 'fs'
face = require 'cool-ascii-faces'

module.exports = (filename) ->
  timeoutId = null
  makeFace = ->
    newFace = "say \"#{face()}\"\n"
    fs.writeFile filename, newFace, (err) ->
      return console.log(err) if err
      timeoutId = setTimeout makeFace, 1000
      return
  faceRunner =
    stop: -> clearTimeout timeoutId
    start: -> makeFace() unless timeoutId?
