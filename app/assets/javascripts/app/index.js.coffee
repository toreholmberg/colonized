#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class App extends Spine.Controller
  constructor: ->
    super

    @users = new App.Users
    @groups = new App.Groups
    @posts = new App.Posts

    @append @groups

    Spine.Route.setup(history: false)

window.App = App