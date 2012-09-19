$ = jQuery.sub()
Group = App.Group

class App.Groups extends Spine.Controller
  className: 'groups'

  constructor: ->
    super

    App.Post.bind 'refresh change', @render

    @routes
      "/:id": (params) =>
        App.CLNZD.currentGroupId = params.id
        @item = Group.find params.id
        @render()
        @load()

  load: =>
    App.Post.deleteAll()
    App.Post.fetch()

  render: =>
    @html @view('groups/show')(@item)