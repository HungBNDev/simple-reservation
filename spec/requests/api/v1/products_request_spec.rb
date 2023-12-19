require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do
  let(:user) { create :user }

  describe "GET /index" do
    it "returns all products" do
      create_list(:product, 3)
      get api_v1_products_path, headers: { Authorization: "Bearer #{user.generate_jwt}" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "GET /show" do
    it "returns a specific product" do
      product = create(:product)
      get api_v1_product_path(product), headers: { Authorization: "Bearer #{user.generate_jwt}" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["id"]).to eq(product.id)
    end
  end

  describe "POST /create" do
    it "creates a new product" do
      valid_attributes = { name: "New Product", price: 10.50, brand_id: create(:brand).id,currency: Faker::Currency.symbol, data: { custom_field: "Value" } }
      expect {
        post api_v1_products_path, params: valid_attributes, headers: { Authorization: "Bearer #{user.generate_jwt}" }
      }.to change(Product, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /update" do
    it "updates a product" do
      product = create(:product)
      updated_attributes = { name: "Updated Product Name" }
      put api_v1_product_path(product), params: updated_attributes, headers: { Authorization: "Bearer #{user.generate_jwt}" }
      product.reload
      expect(response).to have_http_status(:ok)
      expect(product.name).to eq("Updated Product Name")
    end
  end

  describe "DELETE /destroy" do
    it "deletes a product" do
      product = create(:product)
      expect {
        delete api_v1_product_path(product), headers: { Authorization: "Bearer #{user.generate_jwt}" }
      }.to change(Product, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
