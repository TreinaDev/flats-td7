FactoryBot.define do
  factory :property_owner do
    email { generate(:email) }
    password { '1234567890' }
  end
end

FactoryBot.define do
  sequence :email do |n|
    "user#{n}@email.com"
  end
end
