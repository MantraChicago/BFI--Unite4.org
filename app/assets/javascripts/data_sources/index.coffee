#= require ./campaigns
#= require ./causes
#= require ./locations
#= require ./needs

# The CollectionManager is a proxy for singleton instances of any
# collection class.  It is used internally in the Application.Collection
# to resolve hasMany and belongsTo relationships
class Application.CollectionManager
  scope: "default"

  instances:
    default: {}

  constructor: (@options={})->
    _.extend(@, @options)

  getScope: ()->
    @instances[@scope]

  setScope: (@scope="default")->
    @scope()

  get:(name, initialModels=[], options={})->
    scope = @getScope()

    if existing = scope[name]
      return existing

    if CollectionClass = Application.CollectionManager.findCollectionClassByName(name)
      scope[name] = new CollectionClass(initialModels,options)


Application.CollectionManager.findCollectionClassByName = (name, searchInNamespace)->
  searchInNamespace ||= Application.collections

  for className, collectionClass of searchInNamespace
    if collectionClass.prototype.name is name
      return collectionClass

Application.CollectionManager.getSingleton = (options={})->
  Application.CollectionManager.singleton ||= new Application.CollectionManager(options)

Application.collection = (collectionName, models=[], options={})->
  Application.CollectionManager.getSingleton().get(collectionName, models, options)