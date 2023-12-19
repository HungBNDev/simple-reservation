require 'swagger_helper'

RSpec.describe Api::V1::BrandsController, type: :request, swagger_doc: 'v1/swagger.yaml' do
  let!(:brands) { create_list :brand, 3 }
  let(:user) { create :user }
  let(:"Authorization") { "Bearer #{user.generate_jwt}" }
  path '/api/v1/brands' do
    get 'List all brands' do
      tags 'Brands'
      produces 'application/json'
      consumes 'application/json'
      security [Bearer: []]
      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :string, nullable: true}
                 },
                 required: ['id', 'name']
               }
        run_test! do |response|
          response_body = JSON.parse(response.body)
          expect(response_body.count).to eq 3
          expect(response_body.map { |i| i["id"] }.sort).to eq brands.map(&:id).sort
          expect(response_body.map { |i| i["name"] }.sort).to eq brands.map(&:name).sort
        end
      end
    end
  end
end
