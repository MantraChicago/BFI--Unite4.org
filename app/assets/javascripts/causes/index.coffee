#= require ./legacy
#= require ./data
#= require_self

Application.causes = ()->

Application.causes.index = ()->
  window.App = {}

  App.needsCollection = new Application.collections.Causes()



# needsCollection=parseObjIntoModels(Application.data.needs, Backbone.Model.extend({
#     name:'needs'
#     }))

#   var causesCollection=parseObjIntoModels(Application.data.causes, Cause)
#     var locationsCollection=parseObjIntoModels(Application.data.locations, Location)

#     var map =createGoogleMap($('#map-canvas')[0])

#     populateMapMarkers(map,locationsCollection.models)

#     var filterOptions={
#       'Causes':{
#         'models':causesCollection.models,
#         'filterFunction':function(model,id){
#           return model.get('cause_id')==id;
#          }
#       }
#     }

#   var modelNames = ['DonationsNeed', 'GoodNeed', 'VolunteerNeed'];

#   for(var i in modelNames ){
#     var modelName= modelNames[i]
#     filterOptions[modelName.replace('N',' N')]={
#       'models':needsCollection.filter(function(model){ return model.get('type')==modelName}),
#         'filterFunction':function(model,id){
#         var need=needsCollection.get(id)
#         return model.get('cause_id')==need.get('cause_id')
#         }
#     }
#   }

#   var filterView = new FilterView({
#    el: $('#accordian-holder'),
#    locationsCollection:locationsCollection,
#    filterOptions:filterOptions
#   });
