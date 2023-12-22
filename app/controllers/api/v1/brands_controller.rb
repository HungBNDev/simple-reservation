# frozen_string_literal: true

module Api
  module V1
    class BrandsController < ApplicationController
      before_action :set_brand, only: [:show, :update, :destroy]

      def index
        @brands = Brand.all
        render json: @brands
      end

      def show
        render json: @brand
      end

      def create
        @brand = Brand.new(brand_params)
        if @brand.save
          render json: @brand, status: :created
        else
          render json: @brand.errors, status: :unprocessable_entity
        end
      end

      def update
        if @brand.update(brand_params)
          render json: @brand
        else
          render json: @brand.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @brand.destroy
        head :no_content
      end

      private

      def set_brand
        @brand = Brand.find(params[:id])
      end

      def brand_params
        params.permit(
          :name,
          custom_fields: %i[
            custom_field_1
            custom_field_2
            custom_field_3
            custom_field_4
            custom_field_5
          ]
        )
      end
    end
  end
end
