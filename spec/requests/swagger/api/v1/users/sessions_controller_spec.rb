require 'swagger_helper'

RSpec.describe Api::V1::Users::SessionsController, type: :request, swagger_doc: 'v1/swagger.yaml' do
  path '/api/v1/users/sign_in' do
    post 'User login' do
      tags 'User Authentication'
      consumes 'application/json'
      parameter name: :user_login_params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ['email', 'password']
      }

      response '200', 'User logged in successfully' do
        let(:user) { create(:user) }
        let(:user_login_params) { { email: user.email, password: user.password } }
        run_test! do |response|
          response_body = JSON.parse(response.body)

          expect(response_body["id"]).to eq(user.id)
          expect(response_body["email"]).to eq(user.email)
          expect(response_body["token"].present?).to eq(true)
        end
      end
    end
  end
end
