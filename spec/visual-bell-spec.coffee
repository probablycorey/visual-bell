{$, RootView} = require 'atom'
VisualBell = require '../lib/visual-bell'

describe "VisualBell", ->
  beforeEach ->
    atom.rootView = new RootView()
    atom.packages.activatePackage("visual-bell", immediate: true)

  describe "when visual bells are enabled (default)", ->
    it "appends div.visual-bell to body on 'beep' event", ->
      atom.rootView.trigger 'beep'
      expect($('body > .visual-bell')).toExist()

    it "does not ever create two overlays", ->
      atom.rootView.trigger 'beep'
      atom.rootView.trigger 'beep'
      expect($('body > .visual-bell')).toHaveLength 1

  describe "when visual bells are disabled", ->
    it "does not append div.visual-bell on 'beep' event", ->
      atom.config.set('visual-bell.enabled', false)
      atom.rootView.trigger 'beep'
      expect($('body > .visual-bell')).not.toExist()
