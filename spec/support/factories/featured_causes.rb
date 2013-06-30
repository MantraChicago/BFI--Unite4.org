# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :featured_cause do
    association(:cause)
  end
end
