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

  @allSortedBy: (key, reverse) ->
    all = @all()
    _(all).sortBy (p) -> [key]
    all.reverse() if reverse

  @eachSortedBy: (callback, key, reverse) ->
    all = @allSortedBy(key, reverse)
    for key, value of all
      callback(value.clone())