class App.Post extends Spine.Model
  @configure 'Post', 'content', 'created_at', 'updated_at', 'index'
  @belongsTo 'group', 'App.Group'
  @belongsTo 'user', 'App.User'
  @extend Spine.Model.Ajax

  @load: (id) ->
    @url = "/groups/#{id}/posts"
    @page = 0
    @deleteAll()
    @fetch()

  @fetch: (params) ->
    params or= 
      data:
        page: @page++
      processData: true
    super(params)

  @allSortedBy: (keys, reverse) ->
    all = @all()
    _(all).sortBy (p) -> keys
    all.reverse() if reverse
    all

  @eachSortedBy: (callback, keys, reverse) ->
    all = @allSortedBy(keys, reverse)
    for key, value of all
      callback(value.clone())