FactoryGirl.define do
  factory :cash_donation_need do
    association :cause
  end

  factory :goods_donation_need do
    association :cause
  end

  factory :volunteer_need do
    association :cause
  end

  factory :follower_need do
    association :cause
  end
end
