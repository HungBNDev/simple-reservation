# frozen_string_literal: true

class Brand < ApplicationRecord
  validates :name, presence: true

  has_many :products

  include ::AASM

  aasm(:state) do
    state :inactive, initial: true
    state :active

    event :launch do
      transitions from: :inactive, to: :active
    end

    event :stop do
      transitions from: :active, to: :inactive
    end
  end
end
