# frozen_string_literal: true

class Card < ApplicationRecord
  before_create :generate_activation_number

  belongs_to :client
  belongs_to :product

  private

  def generate_activation_number
    self.activation_number = SecureRandom.hex(10) # or any other logic for unique number
  end
end
