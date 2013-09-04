unless Rails.env.production?

  CauseType.create_defaults

  Badge.create_defaults

  City.create_defaults

end
