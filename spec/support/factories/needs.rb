# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :need do
    association :cause
    type_of_need "followers"

    trait :cash do
      type_of_need "cash_donations"
    end

    trait :goods do
      type_of_need "goods_donations"
    end

    trait :social do
      type_of_need "followers"
    end

    trait :volunteers do
      type_of_need "volunteers"
    end
  end
end