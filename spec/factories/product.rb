FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "name #{n}" }
    price { Faker::Commerce.price(range: 0.01..100.0) }
    currency { Faker::Currency.symbol }
    brand
    custom_fields { { custom_field_1: "Custom Value" } } # Customize as needed
  end
end
