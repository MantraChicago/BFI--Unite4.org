Application.models.Cause = Application.Model.extend
  hasMany: [
    "locations"
    "campaigns"
    "needs"
  ]

Application.collections.Causes = Application.Collection.extend
  model: Application.models.Cause
  name: "causes"
