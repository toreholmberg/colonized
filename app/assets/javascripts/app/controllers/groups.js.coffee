Group = App.Group

class App.Groups extends Spine.Controller
  className: 'group'

  constructor: ->
    super

    @meta = new App.GroupMeta
    @posts = new App.Posts
    @loadMore = new App.GroupLoadMore
    @append @meta, @posts, @loadMore

  load: (id) =>
    @meta.render Group.find(id)
    @posts.clear()