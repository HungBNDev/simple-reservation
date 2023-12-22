# frozen_string_literal: true

module Api
  module V1
    module Clients
      class CardsController < Api::V1::Clients::BaseController
        skip_before_action :authenticate_request

        def create
          @card = Card.new(card_params)
          if @card.save
            render json: @card, status: :created
          else
            render json: @card.errors, status: :unprocessable_entity
          end
        end

        private

        def card_params
          # Ensure clients can only request cards for their own accounts
          params.permit(:product_id).merge(client_id: current_client_id)
        end

        def current_client_id
          current_client.id
        end
      end
    end
  end
end
