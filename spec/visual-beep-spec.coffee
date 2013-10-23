{$, RootView} = require 'atom'
VisualBeep = require '../lib/visual-beep'

describe "VisualBeep", ->
  beforeEach ->
    window.rootView = new RootView()
    atom.activatePackage("visual-beep", immediate: true)

  describe "when visual beeps are enabled (default)", ->
    it "appends div.visual-beep to body on 'beep' event", ->
      rootView.trigger 'beep'
      expect($('body > .visual-beep')).toExist()

  describe "when visual beeps are disabled", ->
    it "does not append div.visual-beep on 'beep' event", ->
      config.set('visual-beep.enabled', false)
      rootView.trigger 'beep'
      expect($('body > .visual-beep')).not.toExist()
