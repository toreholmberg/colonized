class App.Post extends Spine.Model
  @configure 'Post', 'content', 'created_at', 'updated_at', 'index'
  @belongsTo 'group', 'App.Group'
  @belongsTo 'user', 'App.User'
  @extend Spine.Model.Ajax

  @url: ->
    "/groups/#{App.CLNZD.currentGroupId}/posts"

  @fetch: (params) ->
    params or= 
      data:
        index: @last()?.id or 0
      processData: true
    super(params)