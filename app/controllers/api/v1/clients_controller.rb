# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApplicationController
      before_action :authenticate_request

      def index
        @clients = Client.all
        render json: @clients
      end

      def show
        @client = Client.find(params[:id])
        render json: @client
      end

      def create
        @client = Client.new(client_params)
        if @client.save
          render json: @client, status: :created
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      def update
        @client = Client.find(params[:id])
        if @client.update(client_params)
          render json: @client
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @client = Client.find(params[:id])
        @client.destroy
        head :no_content
      end

      private

      def client_params
        params.permit(:name, :email, :password, :payout_rate)
      end
    end
  end
end
