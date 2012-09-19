class App.GroupMeta extends Spine.Controller
  className: 'meta'

  constructor: ->
    super

  render: (item) => @html @view('group_meta')(item)