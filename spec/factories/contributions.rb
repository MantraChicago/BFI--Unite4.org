# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contribution do
    user_id 1
    need_type "MyString"
    need_id 1
  end
end
