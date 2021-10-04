require 'rails_helper'

describe 'Property owner view own properties' do
  it 'using menu' do
    # Arrange
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

    #Act
    login_as property_owner, scope: :property_owner
    visit root_path

    # Assert
    expect(page).to have_link('Meus Imóveis', href: my_properties_properties_path)
  end

  it 'and should view owned properties' do
    # Arrange
    jane = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
    peter = PropertyOwner.create!(email: 'peter@parker.com.br', password: '123456789')

    casa = PropertyType.create!(name: 'Casa')
    Property.create!({ title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, parking_slot: true, bathrooms: 2, daily_rate: 150,
                      property_type: casa, property_owner: jane
                    })
    Property.create!({ title: 'Casa com piscina em Porto Alegre', 
                    description: 'Ótima casa, com todos acessórios e internet rápida',
                    rooms: 2, parking_slot: false, bathrooms: 1, daily_rate: 100,
                    property_type: casa, property_owner: peter
                  })

    #Act
    login_as jane, scope: :property_owner
    visit root_path
    click_on 'Meus Imóveis'

    #Assert
    expect(page).to have_content 'Casa com quintal em Copacabana'
    expect(page).not_to have_content 'Casa com piscina em Porto Alegre'
  end

end