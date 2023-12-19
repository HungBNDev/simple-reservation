module Api
  module V1
    module Clients
      class BaseController < ApplicationController
        before_action :authenticate_client

        private

        def authenticate_client
          header = request.headers['Authorization']
          header = header.split(' ').last if header
          begin
            @decoded = JWT.decode(header, secret_key, true, { algorithm: 'HS256' }).first
            @current_client = Client.find(@decoded['id'])
            # Additional payload checks can be performed here
          rescue JWT::DecodeError
            render json: { errors: ['Invalid token'] }, status: :unauthorized
          rescue ActiveRecord::RecordNotFound
            render json: { errors: ['Invalid Client User'] }, status: :unauthorized
          end
        end

        def secret_key
          # Your secret key
          Rails.application.credentials.secret_key_base
        end

        def current_client
          @current_client
        end

        helper_method :current_user
      end
    end
  end
end
