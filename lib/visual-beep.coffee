{$, $$} = require 'atom'

module.exports =
  configDefaults:
    enabled: true

  activate: ->
    rootView.on 'beep', =>
      return unless config.get('visual-beep.enabled')
      @addOverlay()
      setTimeout((=> @removeOverlay()), 300)

  deactivate: ->
    @removeOverlay()

  addOverlay: ->
    @removeOverlay() if @overlay
    @overlay = $$ -> @div class: 'visual-beep'
    $('body').append @overlay

  removeOverlay: ->
    @overlay?.remove()
    @overlay = null
