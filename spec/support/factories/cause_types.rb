FactoryGirl.define do
  factory :cause_type do
    name { CauseType.DefaultCauseTypes.sample }
  end
end
