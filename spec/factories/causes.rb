FactoryGirl.define do
  factory :cause do |f|
    #causeType  CauseType.find_by_name(:Environmental).id
    city  'Chicago'
    state 'IL'
    twitter_handle 'PETA'
    name "PETA"
  end
end

