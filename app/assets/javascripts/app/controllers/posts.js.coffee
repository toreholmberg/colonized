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
    all = Post.all()
    
    # XXX: move somewhere nice
    sortBy = (key, a, b, r) ->
      r = if r then 1 else -1
      return -1*r if a[key] > b[key]
      return +1*r if a[key] < b[key]
      return 0

    all.sort (a,b) -> sortBy('created_at', a, b, true)
    $(all).each (i, item) => @addOne item

  clear: -> @el.empty()