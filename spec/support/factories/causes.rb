# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:company_name) {|n| "#{ Faker::Company.name } #{ n }" }
  sequence(:email) {|n| "#{ n }#{ Faker::Internet.email }" }

  factory :cause do
    association(:cause_type)
    association :user

    name { FactoryGirl.generate(:company_name) }
    email { FactoryGirl.generate(:email) }
    description { Faker::DizzleIpsum.paragraphs.join "\n" }
    mission_statement { Faker::DizzleIpsum.paragraph }
    twitter_handle "soederpop"
    website "http://www.google.com"

    address { Unite::Development.random_address_in(:chicago) }
    cities {[City.find_by_slug('chicago')]}
    cause_types {[CauseType.first]}
    region "IL"
    country "US"
    postal_code "60010"

    trait(:new_york) do
      address_line_one Unite::Development.random_address_in(:new_york)
      cities {[City.find_by_slug('new-york')]}
      country "US"
      postal_code "10004"

      region "NY"
    end

    
  end


end
