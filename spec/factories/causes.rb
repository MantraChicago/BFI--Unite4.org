FactoryGirl.define do
  factory :cause do |f|
    f.cause_type_id  CauseType.find_by_name(:Environmental).id
    f.city  'Chicago'
    f.state 'IL'
    f.twitter_handle 'PETA'
  end
end
