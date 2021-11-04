require "rails_helper"

RSpec.describe PropertyReservationMailer, type: :mailer do
  context 'new reservation' do
    it 'should notify property owner' do
      john = PropertyOwner.create!(email: 'john@doe.com.br', password: '123456')
      johns_property = create(:property, title: 'Apartamento Novo',
                                        description: 'Um apartamento legal',
                                        rooms: 3, bathrooms: 2, pets: true, daily_rate: 100,
                                        property_owner: john)

      andrew = User.create!(email: 'andrew@doe.com.br', password: '123456')

      reservation = PropertyReservation.create!(start_date: 1.week.from_now,
                                                end_date: 2.weeks.from_now,
                                                guests: 6, 
                                                property: johns_property, user: andrew)


      mail = PropertyReservationMailer.with(reservation: reservation).notify_new_reservation()

      expect(mail.to).to eq ['john@doe.com.br']
      expect(mail.from).to eq ['nao-responda@flats.com.br']
      expect(mail.subject).to eq 'Nova reserva para seu imóvel'
      expect(mail.body).to include "Seu imóvel 'Apartamento Novo' foi reservado por andrew@doe.com.br"
    end
  end
end