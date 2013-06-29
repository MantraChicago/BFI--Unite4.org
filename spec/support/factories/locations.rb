FactoryGirl.define do
  factory :location do
    association(:cause)

    skip_geocoding true

    # default to chicago
    address_line_one { Unite::Development.random_address_in(:chicago) }
    city "Chicago"
    region "IL"
    country "US"
    postal_code "60010"
    lat { "41.#{ 82000 + (rand * 9999).to_i }".to_f }
    lng { "-87.#{ 640000 + (rand * 9999).to_i }".to_f }

    trait :chicago do
      name "Chicago Office"
    end

    trait :new_york do
      address_line_one { Unite::Development.random_address_in(:new_york) }
      name "New York Office"
      city "New York"
      region "NY"
      postal_code '10004'
      lat { "40.#{ 700000 + (rand * 9999).to_i }".to_f }
      lng { "-74.#{ 10000 + (rand * 9999).to_i }".to_f }
    end

    trait :san_francisco do
      address_line_one { Unite::Development.random_address_in(:san_francisco) }
      city "San Francisco"
      region "CA"
      country "US"
      postal_code '94117'
      lat { "37.#{ 770000 + (rand * 9999).to_i }".to_f }
      lng { "-122.#{ 440000 + (rand * 9999).to_i }".to_f }
    end
  end
end
