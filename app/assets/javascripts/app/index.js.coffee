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

    @sidebar = new App.Sidebar
    @main = new App.Main
    @append @sidebar, @main

    Spine.Route.setup()

window.App = App

