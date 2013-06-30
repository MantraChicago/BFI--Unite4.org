BFI.LocationsController = Ember.ArrayController.extend

  populate: (data) ->
    for location in data
      this.pushObject BFI.Location.create(location)
