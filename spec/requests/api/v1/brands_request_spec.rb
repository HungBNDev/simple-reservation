require 'rails_helper'

RSpec.describe "Api::V1::Brands", type: :request do
  let(:user) { create :user }

  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/brands", headers: { Authorization: "Bearer #{user.generate_jwt}" }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) { { name: Faker::Commerce.brand, custom_fields: { custom_field_1: "Info1" } } }

    it "creates a new Brand" do
      expect {
        post "/api/v1/brands", params: valid_attributes, headers: { Authorization: "Bearer #{user.generate_jwt}" }
      }.to change(Brand, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /update" do
    let(:brand) { create(:brand) }
    let(:valid_attributes) { { name: "Updated Brand" } }
    let(:invalid_attributes) { { name: nil } }

    context "with valid parameters" do
      it "updates the requested brand" do
        put api_v1_brand_path(brand), params: valid_attributes, headers: { Authorization: "Bearer #{user.generate_jwt}" }
        brand.reload
        expect(brand.name).to eq("Updated Brand")
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid parameters" do
      it "returns unprocessable entity" do
        put api_v1_brand_path(brand), params: invalid_attributes, headers: { Authorization: "Bearer #{user.generate_jwt}" }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:brand) { create(:brand) }

    it "destroys the requested brand" do
      expect {
        delete api_v1_brand_path(brand), headers: { Authorization: "Bearer #{user.generate_jwt}" }
      }.to change(Brand, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
  # More tests for SHOW, UPDATE, DELETE
end
