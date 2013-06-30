BFI.CausesController = Ember.ArrayController.extend
  needs: ['cause', 'locations', 'needs']

  populate: (data) ->
    for cause in data
      this.pushObject BFI.Cause.create(cause)

  cities: ['Chicago', 'New York', 'San Francisco']

  activeCity: 'Chicago'

  types: ['Art', 'Education', 'Philanthropy']

  activeType: 'Art'
