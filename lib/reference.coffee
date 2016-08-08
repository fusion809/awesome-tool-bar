{exec} = require("child_process")

module.exports =
  docs: ->
    exec("xdg-open http://en.cppreference.com/w/")
