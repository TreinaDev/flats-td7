require 'rails_helper'

describe 'Visitor filter properties by type' do
  it 'using links on home page' do
    # Arrange
    PropertyType.create!(name: 'Apartamento')
    PropertyType.create!(name: 'Casa')
    PropertyType.create!(name: 'Sítio')

    # Act
    visit root_path

    # Assert
    expect(page).to have_link('Apartamento')
    expect(page).to have_link('Casa')
    expect(page).to have_link('Sítio')
  end

  it 'sucessfully' do
    # Arrange
    apartamento = PropertyType.create!(name: 'Apartamento')
    casa = PropertyType.create!(name: 'Casa')
    Property.create!({ title: 'Cobertura em Manaus', 
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, parking_slot: false, bathrooms: 2, daily_rate: 150,
                      property_type: apartamento
                    })
    Property.create!({ title: 'Casa com quintal em Copacabana', 
                    description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                    rooms: 3, parking_slot: true, bathrooms: 2, daily_rate: 150,
                    property_type: casa
                  })
    # Act
    visit root_path
    click_on 'Casa'

    # Assert
    expect(page).to have_css('h1', text: 'Imóveis do tipo Casa')
    expect(page).to have_content('Casa com quintal em Copacabana')
    expect(page).not_to have_content('Cobertura em Manaus')
  end

end