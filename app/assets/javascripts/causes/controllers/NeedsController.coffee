BFI.NeedsController = Ember.ArrayController.extend

  populate: (data) ->
    for need in data
      this.pushObject BFI.Need.create(need)
