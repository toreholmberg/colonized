$ = jQuery.sub()

class App.PostItem extends Spine.Controller

  # events:

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