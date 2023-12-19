# frozen_string_literal: true

module ApiErrorResponder
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from StandardError, with: :standard_error
    # Add more custom error types as needed
  end

  private

  def record_not_found(exception)
    render_error(404, exception.message)
  end

  def record_invalid(exception)
    render_error(422, exception.record.errors.full_messages.join(', '))
  end

  def standard_error(exception)
    render_error(500, exception.message)
  end

  def unauthorized_access(exception)
    render_error(401, exception.message)
  end

  def render_error(status, message)
    render json: { error: message }, status: status
  end
end
