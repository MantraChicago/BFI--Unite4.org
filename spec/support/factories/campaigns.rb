# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    association(:cause)
    association(:need)
  end
end
