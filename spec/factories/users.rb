FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "janedoe#{n}@user.com" }
    password { '123456' }
  end
end