class Product < ApplicationRecord
  belongs_to :brand

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

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
