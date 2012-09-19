Post = App.Post

class App.GroupLoadMore extends Spine.Controller
  className: 'load-more'

  events:
    'click button': 'click'

  constructor: ->
    super
    @render()

  render: => @html @view('group_load_more')()
  
  click: (e) => Post.fetch()