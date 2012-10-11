exports = window

class Event
  constructor: (@type, @name, @args...) ->
    @context = {}
    @style = []
    @hook = @type + ' ' + @name

  setContext: (server, channel) ->
    @context = {server, channel}

  ##
  # Sets a custom style for the event that will effect how it's contents are
  # displayed.
  # @param {...string} style
  ##
  setStyle: (@style...) ->

  @wrap: (obj) ->
    return obj if obj instanceof Event
    event = new Event obj.type, obj.name, obj.args...
    event.setContext obj.server, obj.channel
    event

exports.Event = Event