Application.models.CauseType = Application.Model.extend
  hasMany: "causes"

Application.collections.CauseTypes = Application.Collection.extend
  model: Application.models.CauseType
  name: "cause_types"
