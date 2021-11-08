require 'rails_helper'

describe 'Property API' do
  context 'GET /api/v1/properties' do
    it 'should get properties' do
      property = create(:property, title: 'Apartamento com churrasqueira')
      other_property = create(:property, title: 'Casa com piscina')

      get '/api/v1/properties'

      expect(response).to have_http_status(200)
      expect(parsed_body.first[:title]).to eq('Apartamento com churrasqueira')
      expect(parsed_body.second[:title]).to eq('Casa com piscina')
      expect(parsed_body.count).to eq(2)
    end

    it 'returns no properties' do
      get '/api/v1/properties'

      expect(response).to have_http_status(200)
      expect(parsed_body).to be_empty
    end
  end

  context 'GET /api/v1/properties/:id' do
    it 'should return a property' do
      property = create(:property, title: 'Apartamento legal', bathrooms: 5,
                                   daily_rate: 200, pets: true)

      get "/api/v1/properties/#{property.id}"

      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      expect(parsed_body[:title]).to eq('Apartamento legal')
      expect(parsed_body[:bathrooms]).to eq(5)
      expect(parsed_body[:daily_rate]).to eq('200.0')
      expect(parsed_body[:pets]).to eq(true)
    end
  end
end