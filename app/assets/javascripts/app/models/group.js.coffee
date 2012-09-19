class App.Group extends Spine.Model
  @configure 'Group', 'title', 'status', 'created_at'
  @belongsTo 'user', 'App.User'
  @hasMany 'posts', 'App.Post'
  @extend Spine.Model.Ajax