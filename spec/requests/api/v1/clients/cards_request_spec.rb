require 'rails_helper'

RSpec.describe Api::V1::Clients::CardsController, type: :request do
  let(:client) { create(:client) }
  let(:product) { create(:product) }
  let!(:user) { create :user }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new Card' do
        expect { post "/api/v1/clients/cards", params: { product_id: product.id }, headers: { Authorization: "Bearer #{client.generate_jwt}" } }.to change(Card, :count).by(1)
      end

      it 'returns a success response' do
        post "/api/v1/clients/cards", params: { product_id: product.id, client_id: client.id }, headers: {
          Authorization: "Bearer #{client.generate_jwt}"
        }
        expect(response).to be_successful
      end
    end
  end
end
