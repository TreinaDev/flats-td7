FactoryBot.define do
  factory :property_reservation do
    property
    user
    guests { rand(1..10) }
    start_date { 1.week.from_now }
    end_date { 2.week.from_now }
  end
end