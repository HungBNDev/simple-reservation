# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApiErrorResponder

  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JWT.decode(header, secret_key, true, { algorithm: 'HS256' }).first
      @current_user = User.find(@decoded['id'])
      # Additional payload checks can be performed here
    rescue JWT::DecodeError
      render json: { errors: ['Invalid token'] }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound
      render json: { errors: ['Invalid user'] }, status: :unauthorized
    end
  end

  def secret_key
    # Your secret key
    Rails.application.credentials.secret_key_base
  end

  def current_user
    @current_user
  end

  helper_method :current_user
end
