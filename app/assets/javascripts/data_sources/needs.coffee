Application.models.Need = Application.Model.extend
  belongsTo: "cause"

Application.collections.Needs = Application.Collection.extend
  model: Application.models.Need
  name: "needs"
