FactoryBot.define do
  factory :client do
    sequence(:name) { |n| "name #{n}" }
    authentication_credentials { Faker::Blockchain::Bitcoin.address }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end
end
