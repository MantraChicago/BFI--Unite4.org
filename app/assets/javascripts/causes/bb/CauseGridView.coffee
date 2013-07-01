BFI.CauseGridView = Backbone.View.extend
 
  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments

    #set our list of causes syncronously from local cache
    @collection = new Backbone.Collection Application.data.causes

  render: () ->
    listHTML = @collection.map( ((cause) ->
      return causeItem = new BFI.CauseGridItemView
        model: cause.toJSON()
        container: @container
      #@$el.append causeItem.render().$el
    ), @)
    
    return @
