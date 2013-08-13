unless Rails.env.production?

  CauseType.create_defaults

  Badge.create_defaults(true)

  City.create_defaults

end
