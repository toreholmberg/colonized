$ = jQuery.sub()
Group = App.Group
Post = App.Post

class App.Groups extends Spine.Controller
  className: 'groups'

  events:
    'click button.more': 'moreClickHandler'

  constructor: ->
    super

    Post.bind 'refresh change', @render

  load: (id) =>
    @item = Group.find id
    @render()

  render: =>
    @html @view('group')(@item)

  moreClickHandler: ->
    Post.fetch()