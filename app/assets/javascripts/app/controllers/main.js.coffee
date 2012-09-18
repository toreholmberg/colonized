class App.Main extends Spine.Controller
  className: 'main'

  constructor: ->
    super
    
    @sidebar = new App.Sidebar
    @users = new App.Users
    @groups = new App.Groups
    @posts = new App.Posts

    @routes
      '/users': (params) ->
        @users.active(params)
      '/groups': (params) ->
        @groups.active(params)
      '/posts': (params) ->
        @posts.active(params)

    @append @sidebar


