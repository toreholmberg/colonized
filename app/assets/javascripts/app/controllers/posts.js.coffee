Post = App.Post

class App.Posts extends Spine.Controller
  className: 'posts'

  constructor: ->
    super
    Post.bind "refresh", @addAll
    Post.bind "create", @addOne

  addOne: (item) =>
    post = new App.PostItem(item: item)
    @prepend post.render()

  addAll: => 
    posts = Post.allSortedBy 'created_at', true
    _(posts).each (item) =>
      unless @el.find(".post[data-id=#{item.id}]").length > 0
        post = new App.PostItem(item: item)
        @append post.render()

  clear: -> @el.empty()