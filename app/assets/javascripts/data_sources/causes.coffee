Application.models.Cause = Application.Model.extend
  idAttribute: "my_custom_id_field"
  
  hasMany: [
    "locations"
    "campaigns"
    "needs"
  ]
  
Application.collections.Causes = Application.Collection.extend
  model: Application.models.Cause
  name: "causes"
