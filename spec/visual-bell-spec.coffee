{$, RootView} = require 'atom'
VisualBell = require '../lib/visual-bell'

describe "VisualBell", ->
  beforeEach ->
    window.rootView = new RootView()
    atom.activatePackage("visual-bell", immediate: true)

  describe "when visual bells are enabled (default)", ->
    it "appends div.visual-bell to body on 'beep' event", ->
      rootView.trigger 'beep'
      expect($('body > .visual-bell')).toExist()

    it "does not ever create two overlays", ->
      rootView.trigger 'beep'
      rootView.trigger 'beep'
      expect($('body > .visual-bell')).toHaveLength 1

  describe "when visual bells are disabled", ->
    it "does not append div.visual-bell on 'beep' event", ->
      config.set('visual-bell.enabled', false)
      rootView.trigger 'beep'
      expect($('body > .visual-bell')).not.toExist()
