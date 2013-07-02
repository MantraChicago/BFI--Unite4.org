# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    association(:cause)
    association(:need)

    desired_state "100"
    current_state "0"

    trait :social do
      association(:need,:social)
    end

    trait :cash do
      association(:need,:cash)
    end

    trait :goods do
      association(:need,:goods)
    end

    trait :volunteers do
      association(:need,:volunteers)
    end
  end
end
