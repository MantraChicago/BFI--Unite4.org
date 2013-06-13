Application.models.Cause = Backbone.Model.extend()

Application.collections.Causes = Backbone.Collection.extend
  model: Application.models.Cause
  url: "/api/v1/causes"