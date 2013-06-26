Application.models.City = Application.Model.extend()

Application.collections.Cities = Application.Collection.extend
  model: Application.models.City
  name: "cities"
