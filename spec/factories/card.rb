FactoryBot.define do
  factory :card do
    client
    product
    activation_number { Faker::Number.number }
    purchase_details_pin { Faker::Code.npi }
    state { "issued" }
  end
end
