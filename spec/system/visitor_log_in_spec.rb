require 'rails_helper'

describe 'Visitor log in' do
  context 'as property owner' do
    it 'successfully' do
      property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

      visit root_path
      click_on 'Entrar como proprietário'
      fill_in 'Email', with: property_owner.email
      fill_in 'Senha', with: property_owner.password
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_content('Login efetuado com sucesso!')
      expect(page).to have_content(property_owner.email)
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Entrar')
      expect(page).to have_link('Cadastrar Imóvel')
    end

    it 'and logs out' do
      property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

      login_as property_owner, scope: :property_owner
      visit root_path
      click_on 'Logout'

      expect(page).to have_content('Saiu com sucesso')
      expect(page).to_not have_content(property_owner.email)
      expect(page).to_not have_link('Logout')
      expect(page).to have_link('Entrar')
      expect(page).to_not have_link('Cadastrar Imóvel')
    end

    it 'and create an account' do
      # TODO: Fazer este teste depois
    end
  end

  context 'as user' do
    it 'successfully' do
      user = User.create!(email: 'peter@doe.com.br', password: '123456789')

      visit root_path
      click_on 'Entrar como locador'
      fill_in 'E-mail', with: user.email
      fill_in 'Senha', with: user.password
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_content('Login efetuado com sucesso!')
      expect(page).to have_content(user.email)
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Entrar como locador')
      expect(page).not_to have_link('Cadastrar Imóvel')
    end

    it 'and logs out' do
      user = User.create!(email: 'peter@doe.com.br', password: '123456789')

      login_as user, scope: :user
      visit root_path
      click_on 'Logout'

      expect(page).to have_content('Saiu com sucesso')
      expect(page).to_not have_content(user.email)
      expect(page).to_not have_link('Logout')
      expect(page).to have_link('Entrar como locador')
      expect(page).to_not have_link('Cadastrar Imóvel')
    end
  end
end