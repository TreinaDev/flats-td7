FactoryBot.define do
  factory :property_owner do
    email { generate(:email) }
    password { "12321312312312" }
  end
end


FactoryBot.define do
  sequence :email do |n|
    "user#{n}@email.com"
  end
end