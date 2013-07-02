BFI.CauseListView = Backbone.View.extend

  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments
    
  render: ->
    #create a "staging" jquery element to avoid 
    #repeated dom re-renders
    $prep = $('<div></div>')
  
    @collection.each( ((cause) ->
      causeItem = new BFI.CauseItemView
        model: cause.toJSON()
        className: "cause"
        container: @container
      $prep.append causeItem.render().$el
    ), @)

    #load the prepared jquery tree into the dom
    @$el.html $prep
    return @
