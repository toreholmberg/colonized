class App.Post extends Spine.Model
  @configure 'Post', 'content', 'group', 'user'
  @extend Spine.Model.Ajax