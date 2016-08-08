module.exports =
  activate: (state) ->
    require('atom-package-deps').install('tool-bar-main')
    require('atom-package-deps').install('open-on-github')
    require('atom-package-deps').install('git-plus')
    require('atom-package-deps').install('git-time-machine')
    require('atom-package-deps').install('terminal-fusion')
    require('atom-package-deps').install('ask-stack')
    require('atom-package-deps').install('recent-finder')

  deactivate: ->
    @toolBar?.removeItems()

  serialize: ->

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'main-tool-bar'

    @toolBar.addButton
      tooltip: 'New File'
      callback: 'application:new-file'
      icon: 'document-text'
      iconset: 'ion'
    @toolBar.addButton
      tooltip: 'Find and Replace'
      callback: 'project-find:show-in-current-directory'
      icon: 'search'
      iconset: 'fa'
    @toolBar.addButton
      tooltip: 'Open Folder'
      callback: 'application:open-folder'
      icon: 'folder'
      iconset: 'ion'
    @toolBar.addButton
      tooltip: 'Save all'
      callback: 'window:save-all'
      icon: 'archive'
      iconset: 'ion'
    @toolBar.addButton
      tooltip: 'Open recent files'
      dependency: 'recent-finder'
      callback: 'recent-finder:toggle'
      icon: 'file-submodule'

    @toolBar.addSpacer()

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

    @toolBar.addSpacer()

    if atom.packages.loadedPackages['build']
      @toolBar.addButton
        'icon': 'hammer'
        'callback': 'build:trigger'
        'dependency': 'build'
        'tooltip': 'Trigger build'
        'iconset': 'ion'
    else if atom.packages.loadedPackages['language-archlinux']
      @toolBar.addButton
        'icon': 'arrow-up'
        'iconset': 'fa'
        'dependency': 'language-archlinux'
        'tooltip': 'Push AUR package changes'
        'callback': 'language-archlinux:aurup'
      @toolBar.addButton
        'icon': 'hammer'
        'iconset': 'ion'
        'dependency': 'language-archlinux'
        'tooltip': 'Build package'
        'callback': 'language-archlinux:makepkg'
      @toolBar.addButton
        'icon': 'warning'
        'iconset': 'fa'
        'dependency': 'language-archlinux'
        'tooltip': 'Check PKGBUILD for errors'
        'callback': 'language-archlinux:namcap'
      @toolBar.addButton
        'icon': 'plus-circle'
        'iconset': 'fa'
        'dependency': 'language-archlinux'
        'tooltip': 'Create new AUR package'
        'callback': 'language-archlinux:newpkg'
      @toolBar.addButton
        'icon': 'wrench'
        'iconset': 'fa'
        'dependency': 'language-archlinux'
        'tooltip': 'Update PKGBUILD checksums'
        'callback': 'language-archlinux:updpkgsums'

    if atom.packages.loadedPackages['script']
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
