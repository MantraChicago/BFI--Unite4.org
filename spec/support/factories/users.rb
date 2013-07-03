FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "password69"
    password_confirmation "password69"
  end
end
