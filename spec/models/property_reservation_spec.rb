require 'rails_helper'

RSpec.describe PropertyReservation, type: :model do
  include ActiveSupport::Testing::TimeHelpers
  describe '#valid?' do
    context 'should not be valid' do
      it 'start date greater than end date' do
        property_type = PropertyType.create!(name: 'Apartamento')
        property_owner = PropertyOwner.create!(email: 'john@doe.com.br', password: '123456')
        property = Property.create!(title: 'Apartamento Novo',
                                description: 'Um apartamento legal',
                                rooms: 3, bathrooms: 2, pets: true, daily_rate: 100,
                                property_type: property_type, property_owner: property_owner)
        user = User.create!(email: 'peter@parker.com', password: '123454235432')

        reservation = PropertyReservation.new(start_date: 5.days.from_now, end_date: 2.days.from_now,
                                              guests: 2, property: property, user: user)

        expect(reservation.valid?).to eq false
      end

      it 'end date equal to start date' do
        property_type = PropertyType.create!(name: 'Apartamento')
        property_owner = PropertyOwner.create!(email: 'john@doe.com.br', password: '123456')
        property = Property.create!(title: 'Apartamento Novo',
                                description: 'Um apartamento legal',
                                rooms: 3, bathrooms: 2, pets: true, daily_rate: 100,
                                property_type: property_type, property_owner: property_owner)
        user = User.create!(email: 'peter@parker.com', password: '123454235432')
        base_date = 5.days.from_now
        reservation = PropertyReservation.new(start_date: base_date, end_date: base_date,
                                              guests: 2, property: property, user: user)

        expect(reservation.valid?).to eq false
      end

      it 'start date is in the past' do

        property_type = PropertyType.create!(name: 'Apartamento')
        property_owner = PropertyOwner.create!(email: 'john@doe.com.br', password: '123456')
        property = Property.create!(title: 'Apartamento Novo',
                                description: 'Um apartamento legal',
                                rooms: 3, bathrooms: 2, pets: true, daily_rate: 100,
                                property_type: property_type, property_owner: property_owner)
        user = User.create!(email: 'peter@parker.com', password: '123454235432')

        reservation = PropertyReservation.new(guests: 2, property: property, user: user)

        travel_to 1.month.ago do 
          reservation.start_date = Date.today
          reservation.end_date = 1.day.from_now
        end
        
        expect(reservation.valid?).to eq false
      end
    end
  end
end
