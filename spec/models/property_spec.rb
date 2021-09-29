require 'rails_helper'

describe Property do
  context 'validations' do
    context 'present' do
      let(:property) { subject }
      it 'title must be present' do
        property.valid?
        expect(
          property.errors.full_messages_for(:title)
        ).to include('Título não pode ficar em branco')
      end

      it 'description must be present' do
        property.valid?
        expect(
          property.errors.full_messages_for(:description)
        ).to include('Descrição não pode ficar em branco')
      end
    end
  end
end
