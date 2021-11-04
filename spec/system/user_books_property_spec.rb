require 'rails_helper'

describe 'user books property' do
  it 'successfully' do
    property_type = PropertyType.create!(name: 'Apartamento')
    property_owner = PropertyOwner.create!(email: 'john@doe.com.br', password: '123456')
    property = Property.create!(title: 'Apartamento Novo',
                                description: 'Um apartamento legal',
                                rooms: 3, bathrooms: 2, pets: true, daily_rate: 100,
                                property_type: property_type, property_owner: property_owner)
    user = User.create!(email: 'jane@doe.com.br', password: '123456')

    login_as user, scope: :user
    visit root_path
    click_on property.title
    fill_in 'Data de início', with: 1.week.from_now
    fill_in 'Data de término', with: 2.weeks.from_now
    fill_in 'Quantidade de pessoas', with: '3'
    click_on 'Enviar Reserva'

    expect(page).to have_content(I18n.localize(1.week.from_now.to_date))
    expect(page).to have_content(I18n.localize(2.weeks.from_now.to_date))
    expect(page).to have_content(/3/)
    expect(page).to have_content('R$ 700,00')
    expect(page).to have_content('Pedido de reserva enviado com sucesso')
  end

  it 'and cancel' do
    property_type = PropertyType.create!(name: 'Apartamento')
    property_owner = PropertyOwner.create!(email: 'john@doe.com.br', password: '123456')
    property = Property.create!(title: 'Apartamento Novo',
                                description: 'Um apartamento legal',
                                rooms: 3, bathrooms: 2, pets: true, daily_rate: 100,
                                property_type: property_type, property_owner: property_owner)
    user = User.create!(email: 'jane@doe.com.br', password: '123456')

    login_as user, scope: :user
    visit root_path
    click_on property.title
    fill_in 'Data de início', with: 1.week.from_now
    fill_in 'Data de término', with: 2.weeks.from_now
    fill_in 'Quantidade de pessoas', with: '3'
    click_on 'Enviar Reserva'

    expect(page).to have_link 'Cancelar Reserva'
  end
end
