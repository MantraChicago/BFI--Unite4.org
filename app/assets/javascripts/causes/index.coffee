Application.causes ||= {}

Application.causes.index = ()->
  App.collection("causes")
