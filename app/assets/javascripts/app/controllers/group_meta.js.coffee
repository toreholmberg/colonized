Post = App.Post

class App.GroupMeta extends Spine.Controller
  className: 'meta'

  events:
    'click button.new': 'click'

  constructor: ->
    super

  render: (@item) => 
    @html @view('group_meta')(@item)

  click: (e) =>
    value = prompt "Enter message:"
    post = new Post(content: value, user: App.User.currentUser())
    post.save()