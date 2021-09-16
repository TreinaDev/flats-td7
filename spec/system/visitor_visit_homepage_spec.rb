require 'rails_helper'

describe 'Visitor visit homepage' do
  it 'successfully' do
    # Dados


    # Execução
    visit root_path

    # Validação
    expect(page).to have_css('h1', text: 'Flats')
    expect(page).to have_css('h3', text: 'Boas vindas ao sistema de locação de '\
                                         'apartamentos')
  end

end

