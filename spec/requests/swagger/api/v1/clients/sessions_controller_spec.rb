require 'swagger_helper'

RSpec.describe Api::V1::Clients::SessionsController, type: :request, swagger_doc: 'v1/swagger.yaml' do
  path '/api/v1/clients/sign_in' do
    post 'Client login' do
      tags 'Client Authentication'
      consumes 'application/json'
      parameter name: :client_login_params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ['email', 'password']
      }

      response '200', 'User logged in successfully' do
        let(:client) { create(:client) }
        let(:client_login_params) { { email: client.email, password: client.password } }
        run_test! do |response|
          response_body = JSON.parse(response.body)

          expect(response_body["id"]).to eq(client.id)
          expect(response_body["email"]).to eq(client.email)
          expect(response_body["token"].present?).to eq(true)
        end
      end
    end
  end
end
