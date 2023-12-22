FactoryBot.define do
  factory :brand do
    sequence(:name) { |n| "name #{n}" }
    custom_fields { { custom_field_1: "Value1", custom_field_2: "Value2" } }
  end
end
