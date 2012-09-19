$ = jQuery.sub()
User = App.User

class App.Users extends Spine.Controller
  className: 'users'

  constructor: ->
    super
    User.bind 'refresh change', @render
    User.fetch()
    
  render: =>
    users = User.all()
    @html @view('users/index')(users: users)