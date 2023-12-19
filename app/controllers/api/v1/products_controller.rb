module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[show update destroy]

      # GET /products
      def index
        @products = Product.all
        render json: @products
      end

      # GET /products/1
      def show
        render json: @product
      end

      # POST /products
      def create
        @product = Product.new(product_params)
        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /products/1
      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # DELETE /products/1
      def destroy
        @product.destroy
      end

      private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.permit(:name, :price, :brand_id, :data, :currency)
      end
    end
  end
end
