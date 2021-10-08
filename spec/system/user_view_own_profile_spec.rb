require 'rails_helper'

describe 'User view own profile' do
  it 'from menu' do 
    user = User.create!(email: 'peter@doe.com.br', password: '123456789')

    visit root_path
    click_on 'Entrar como locador'
    fill_in 'E-mail', with: user.email
    fill_in 'Senha', with: user.password
    within 'form' do
      click_on 'Entrar'
    end
    click_on 'peter@doe.com.br'


    expect(page).to have_content 'Meu Perfil'
    expect(page).to have_content 'peter@doe.com.br'
    expect(current_path).to eq my_profile_path
  end
end