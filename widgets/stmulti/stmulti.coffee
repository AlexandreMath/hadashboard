class Dashing.Stmulti extends Dashing.Widget
  constructor: ->
    super
    @queryState()

  @accessor 'value',
    get: -> if @_value else 'inactive'
    set: (key, value) -> @_value = value

  queryState: ->
    $.get '/smartthings/dispatch',
      widgetId: @get('id'),
      deviceType: 'SmartSense Multi',
      deviceId: @get('device')
      (data) =>
        json = JSON.parse data
        @set 'acceleration', json.value

  ready: ->

  onData: (data) ->
