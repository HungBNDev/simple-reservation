require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has a valid factory' do
    expect(build(:card)).to be_valid
  end

  it 'generates a unique activation number on create' do
    card = create(:card)
    expect(card.activation_number).not_to be_nil
  end
end
