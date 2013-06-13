Application.models.Need = Backbone.Model.extend()

Application.collections.Needs = Backbone.Collection.extend
  url: "/api/v1/needs"
  model: Application.models.Need
