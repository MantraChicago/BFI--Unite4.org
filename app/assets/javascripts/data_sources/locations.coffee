Application.models.Location = Application.Model.extend
  belongsTo: "cause"

Application.collections.Location = Application.Collection.extend
  model: Application.models.Location
  name: "locations"
