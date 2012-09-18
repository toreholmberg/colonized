$ = jQuery.sub()
Group = App.Group

class App.Sidebar extends Spine.Controller
  id: 'sidebar'
  className: 'sidebar'

  events:
    'click ul.groups li': 'groupClickHandler'

  constructor: ->
    super
    Group.bind 'refresh change', @render
    Group.fetch()
    @render()

  render: =>
    groups = Group.all()
    @html @view('sidebar')(groups: groups)

  homeClickHandler: ->
    @navigate '/'

  groupClickHandler: (e) ->
    @navigate '/group', $(e.target).data 'id'