ArcgisjssnippetsView = require './arcgisjssnippets-view'
{CompositeDisposable} = require 'atom'

module.exports = Arcgisjssnippets =
  arcgisjssnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @arcgisjssnippetsView = new ArcgisjssnippetsView(state.arcgisjssnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @arcgisjssnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'arcgisjssnippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @arcgisjssnippetsView.destroy()

  serialize: ->
    arcgisjssnippetsViewState: @arcgisjssnippetsView.serialize()

  toggle: ->
    console.log 'Arcgisjssnippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
