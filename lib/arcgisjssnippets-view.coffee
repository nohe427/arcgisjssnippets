module.exports =
class ArcgisjssnippetsView
  constructor: (serializeState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('arcgisjssnippets')

    # Create message element
    message = document.createElement('div')
    message.textContent = "This does not do anything yet.  We will remove/update this soon."
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
