#= require json2
#= require jquery
#= require underscore-min
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route
#= require spine/relation

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class App extends Spine.Controller
  constructor: ->
    super

    @routes
      '/:id': (params) -> 
        @group params.id

    App.Session.bind 'change', @sessionChange
    App.Session.checkSession()

  start: =>
    App.Group.one 'refresh change', @ready
    App.User.fetch()
    App.Group.fetch()

  ready: =>
    Spine.Route.setup()

  login: =>
    @main.release() if @main
    @session = new App.Session unless @session
    @append @session

  group: (id) =>
    unless App.Group.exists id
      @navigate '', App.Group.first().id
    else
      @session.release() if @session
      @main = new App.Main unless @main
      @append @main
      @main.load id

  sessionChange: (data) =>
    console.log "sessionChange", data
    if data == App.Session.SESSION_FAILURE
      @login()
    else
      @start()

window.App = App