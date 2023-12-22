# frozen_string_literal: true

module Api
  module V1
    module Clients
      class SessionsController < ApplicationController
        skip_before_action :verify_authenticity_token
        skip_before_action :authenticate_request, only: :create

        def create
          client = Client.find_by(email: params[:email])
          if client&.valid_password?(params[:password])
            render json: client, serializer: UserSerializer
          else
            head(:unauthorized)
          end
        end

        def destroy
          current_token = request.headers['Authorization'].split(' ').last
          JwtDenylist.create!(jti: decode_jwt(current_token)['jti'], exp: Time.at(decode_jwt(current_token)['exp']))
          head :no_content
        end

        private

        def decode_jwt(token)
          JWT.decode(token, Rails.application.credentials.secret_key_base).first
        rescue JWT::DecodeError
          {}
        end
      end
    end
  end
end
