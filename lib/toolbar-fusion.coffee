module.exports =
  activate: (state) ->
    {cdocs,pydocs2,pydocs3} = require "./reference"
    atom.commands.add 'atom-text-editor',
      "toolbar-fusion:cdocs": -> cdocs()
      "toolbar-fusion:pydocs2": -> pydocs2()
      "toolbar-fusion:pydocs3": -> pydocs3()

  deactivate: ->
    @toolBar?.removeItems()

  serialize: ->

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'main-tool-bar'

    @toolBar.addButton
      tooltip: 'Open recent files'
      dependency: 'recent-finder'
      callback: 'recent-finder:toggle'
      icon: 'file-submodule'

    @toolBar.addButton
      tooltip: 'Git Plus'
      dependency: 'git-plus'
      callback: 'git-plus:menu'
      icon: 'git-plain'
      iconset: 'devicon'

    @toolBar.addButton
      tooltip: 'Open on GitHub'
      dependency: 'open-on-github'
      callback: 'open-on-github:file'
      icon: 'octoface'

    @toolBar.addButton
      tooltip: 'git-time-machine'
      dependency: 'git-time-machine'
      callback: 'git-time-machine:toggle'
      icon: 'map'
      iconset: 'ion'

    @toolBar.addSpacer()

    @toolBar.addButton
      'icon': 'hammer'
      'iconset': 'ion'
      'callback': 'gpp-compiler:compile'
      'dependency': 'gpp-compiler'
      'tooltip': 'Compile C/C++ project'

    @toolBar.addButton
      'icon': 'play'
      'callback': 'script:run'
      'tooltip': 'Run script'
      'iconset': 'fa'
    @toolBar.addButton
      'icon': 'fast-forward'
      'callback': 'script:run-by-line-number'
      'tooltip': 'Run by Line Number'
      'iconset': 'fa'
    @toolBar.addButton
      'icon': 'stop'
      'callback': 'script:kill-process'
      'tooltip': 'Stop script'
      'iconset': 'fa'
    @toolBar.addButton
      'icon': 'gear'
      'callback': 'script:run-options'
      'tooltip': 'Configure script'
      'iconset': 'fa'

    @toolBar.addButton
      tooltip: 'Terminal'
      dependency: 'terminal-fusion'
      callback: 'terminal-fusion:toggle'
      icon: 'terminal'
      iconset: 'fa'

    @toolBar.addButton
      icon: "book"
      iconset: "fa"
      callback: "toolbar-fusion:cdocs"
      tooltip: "C/C++ Reference Wiki"

    @toolBar.addButton
      icon: "python-plain"
      iconset: "devicon"
      callback: "toolbar-fusion:pydocs2"
      tooltip: "Python 2 Reference Manual"

    @toolBar.addButton
      icon: "python-plain"
      iconset: "devicon"
      callback: "toolbar-fusion:pydocs3"
      tooltip: "Python 3 Reference Manual"

    @toolBar.addButton
      icon: "question"
      dependency: 'ask-stack'
      callback: "ask-stack:ask-question"
      tooltip: "Ask StackOverflow"

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'gear-a'
      callback: 'settings-view:open'
      tooltip: 'Open Settings View'
      iconset: 'ion'

    if atom.inDevMode()
      @toolBar.addSpacer()

      @toolBar.addButton
        icon: 'refresh'
        callback: 'window:reload'
        tooltip: 'Reload Window'
        iconset: 'ion'
      @toolBar.addButton
        icon: 'terminal'
        callback: ->
          require('remote').getCurrentWindow().toggleDevTools()
        tooltip: 'Toggle Developer Tools'
