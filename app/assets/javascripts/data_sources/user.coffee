Application.models.User = Backbone.Model.extend
  url: "/users/me.json"

  initialize: (@attribtues={})->
    Backbone.Model::initialize.apply(@, arguments)

  identify: (callback)->
    @fetch success: (model, response)->
      callback(response)
