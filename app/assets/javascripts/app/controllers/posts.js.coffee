Post = App.Post

class App.Posts extends Spine.Controller
  className: 'posts'

  constructor: ->
    super
    Post.bind "refresh", @addAll
    Post.bind "create", @addOne

  addOne: (item) =>
    unless @el.find(".post[data-id=#{item.id}]").length > 0
      post = new App.PostItem(item: item)
      @append post.render()

  addAll: =>
    Post.eachSortedBy @addOne, 'created_at', true

  clear: -> @el.empty()