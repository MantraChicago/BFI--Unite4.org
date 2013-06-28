FactoryGirl.define do
  factory :location do
    association(:cause)
  end
end
