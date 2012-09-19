#= require json2
#= require jquery
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

window.App = App