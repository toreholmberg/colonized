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

    @routes
      "/:id": (params) =>
        App.CLNZD.currentGroupId = params.id
        @item = Group.find params.id
        @render()
        @load()

  load: =>
    Post.deleteAll()
    Post.fetch()

  render: =>
    @html @view('group')(@item)

  moreClickHandler: ->
    Post.fetch()