class App.Post extends Spine.Model
  @configure 'Post', 'content', 'created_at', 'updated_at'
  @belongsTo 'group', 'App.Group'
  @belongsTo 'user', 'App.User'
  @extend Spine.Model.Ajax