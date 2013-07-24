# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contribution do
    association(:user)
    association(:cause, :skip_default_location=>true)
    association(:need, :volunteers)
  end
end
