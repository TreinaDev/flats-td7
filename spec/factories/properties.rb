FactoryBot.define do
  factory :property do
    title { "Apartamento com churrasqueira" }
    description { "Lindo apartamento no Leme" }
    rooms { 3 }
    bathrooms { 2 }
    daily_rate { 100 }
    property_type
    property_owner
  end
end