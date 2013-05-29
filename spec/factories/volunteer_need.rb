FactoryGirl.define do
  factory :volunteer_need do |f|
  	cause FactoryGirl.create(:cause)
   
  end
end
