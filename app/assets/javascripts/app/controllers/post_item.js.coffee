$ = jQuery.sub()

class App.PostItem extends Spine.Controller
  className: 'post'

  events:
    'click button.edit': 'clickEdit'
    'click button.remove': 'clickRemove'

  constructor: ->
    super
    throw "@item required" unless @item
    @item.bind "update", @render
    @item.bind "destroy", @remove

  render: (item) =>
    @item = item if item
    @html @view('post_item')(@item)

  remove: =>
    $(@el).remove()

  clickEdit: (e) =>
    value = prompt "Edit message:", @item.content
    @item.updateAttribute("content", value) if value

  clickRemove: (e) =>
    @item.destroy() if confirm "You sure?"