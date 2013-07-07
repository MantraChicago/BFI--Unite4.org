FactoryGirl.define do
  factory :follower do
    association :cause
    association :user
  end
end
