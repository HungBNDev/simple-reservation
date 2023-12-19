# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :token

  def token
    object.generate_jwt
  end
end
