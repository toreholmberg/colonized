class App.User extends Spine.Model
  @configure 'User', 'email', 'name'
  @hasMany 'groups', 'App.Group'
  @hasMany 'users', 'App.User'
  @extend Spine.Model.Ajax