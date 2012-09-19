$ = jQuery.sub()
Post = App.Post

class App.Posts extends Spine.Controller
  className: 'posts'

  constructor: ->
    super
    Post.bind 'refresh change', @render
    Post.fetch()
    
  render: =>
    posts = Post.all()
    @html @view('posts/index')(posts: posts)