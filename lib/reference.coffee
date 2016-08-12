{exec} = require("child_process")

module.exports =
  cdocs: () ->
    exec("xdg-open http://en.cppreference.com/w/")
  pydocs2: () ->
    exec("xdg-open https://docs.python.org/2/")
  pydocs3: () ->
    exec("xdg-open https://docs.python.org/3/")
