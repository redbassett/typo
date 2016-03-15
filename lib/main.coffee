{CompositeDisposable} = require 'atom'

module.exports = typo =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace', 'typo:spellcheck': => @spellcheck()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @typoView.destroy()

  serialize: ->
    typoViewState: @typoView.serialize()

  spellcheck: ->
    if editor = atom.workspace.getActiveTextEditor()
      
