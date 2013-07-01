BFI.CauseListView = Backbone.View.extend
 
  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments

    #set our list of causes syncronously from local cache
    @collection = new Backbone.Collection Application.data.causes

  render: () ->
    @collection.each( ((cause) ->
      causeItem = new BFI.CauseItemView
        model: cause.toJSON()
        className: "cause"
        container: @container
      @$el.append causeItem.render().$el
    ), @)
    return @
