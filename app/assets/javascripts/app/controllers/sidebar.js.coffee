$ = jQuery.sub()

class App.Sidebar extends Spine.Controller
  id: 'sidebar'
  className: 'sidebar'

  # elements:
  #   '.items': items
  # 
  events:
    'click ul li.users': 'usersClickHandler'
    'click ul li.groups': 'groupsClickHandler'
    'click ul li.posts': 'postsClickHandler'

  constructor: ->
    super
    @render()

  render: ->
    @html @view('sidebar/show')()

  usersClickHandler: ->
    @navigate '/users'

  groupsClickHandler: ->
    @navigate '/groups'

  postsClickHandler: ->
    @navigate '/posts'