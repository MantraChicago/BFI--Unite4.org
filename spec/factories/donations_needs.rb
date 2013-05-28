FactoryGirl.define do
  factory :donations_need do |f|
  	cause FactoryGirl.create(:cause)
   
  end
end
