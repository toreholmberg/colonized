class App.Main extends Spine.Controller
  className: 'main'

  constructor: ->
    super
    @sidebar = new App.Sidebar
    @groups = new App.Groups
    @append @sidebar, @groups

  load: (id) =>
    @groups.load id
    App.Post.load id