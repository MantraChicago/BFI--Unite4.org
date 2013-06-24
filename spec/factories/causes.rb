# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cause do
    name { Faker::Company.name }
    email { Faker::Internet.email }
    description { Faker::DizzleIpsum.paragraphs.join "\n" }}
    mission_statement { Faker::DizzleIpsum.paragraph }}
    twitter_handle "soederpop"
    website "http://www.google.com"
  end
end
