Application.models.Campaign = Application.Model.extend
  belongsTo: "cause"

Application.collections.Campaigns = Application.Collection.extend
  model: Application.models.Campaign
  name: "campaigns"
