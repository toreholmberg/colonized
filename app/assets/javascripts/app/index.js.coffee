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

    App.Session.bind 'change', @sessionChange
    App.Session.checkSession()

    @sidebar = new App.Sidebar
    @groups = new App.Groups
    @prepend @sidebar, @groups

    @routes
      "/:id": (params) -> @load params.id

    App.Group.one 'refresh change', @ready
    App.User.fetch()
    App.Group.fetch()

  ready: =>
    Spine.Route.setup()

  load: (id) =>
    @groups.load id
    App.Post.load id

  sessionChange: (data) =>
    # XXX: make nice
    if data == App.Session.SESSION_FAILURE
      email = prompt "Email:"
      password = prompt "Password:"
      App.Session.login email, password
    else
      alert "Session created"

window.App = App