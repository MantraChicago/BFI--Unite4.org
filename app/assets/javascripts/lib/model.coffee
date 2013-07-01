Application.Model = Backbone.Model.extend
  name: "Model"

  hasMany: []

  belongsTo: []

  initialize: (@attributes={}, @options={})->
    _.extend(@, @options)

    Backbone.Model.prototype.initialize.call(@, @attribtues, @options)

    throw "Unite Models must specify a singular name property" unless @name


# We want to intercept the call to Application.Model.extend and do a few
# meta-programming tasks to automatically create methods for has many
# and belongs to relationship
Application.Model._extend = (payload)->

  # Coerce string into array.
  for property in ["hasMany","belongsTo"]
    payload[property] = _.flatten [payload[property]]


  _(payload.hasMany).each (relationship)->
    model = @

    payload[relationship] = ()->
      collection  = Application.collection(relationship)
      foreignKey  = "#{ model.name }_id"

      throw "Could not retrieve collection for relationship #{ relationship} " unless collection?

      query = {}
      query[foreignKey] = model.id

      collection && collection.query(query)


  _(payload.belongsTo).each (relationship)->
    model = @

    payload[relationship] = ()->
      collectionName  = _.str.pluralize(relationship)
      collection      = Application.collection(collectionName)
      relatedId       = model.get("#{ relationship }_id")

      throw "Could not retrieve collection for relationship #{ relationship} " unless collection?

      collection && collection.get(relatedId)

  original(payload)
