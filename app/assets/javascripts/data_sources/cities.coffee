Application.models.City = Application.Model.extend()

Application.collections.Cities = Application.Collection.extend
  model: Application.models.City
  name: "cities"

Application.data.cities = [
  name: "Chicago"
  image_url: "/assets/chicago.png"
  lat: 1.0000
  lng: 1.0000
,
  name: "San Francisco"
  image_url: "/assets/san-francisco.png"
  lat: 2.0000
  lng: 2.0000
,
  name: "New York"
  image_url: "/assets/new-york.png"
  lat: 3.0000
  lng: 3.0000
]