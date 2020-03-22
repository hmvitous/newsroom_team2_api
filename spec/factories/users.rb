FactoryBot.define do
  factory :user do
    role {"Journalist"}
    name {"Thomas Blue"}
    email { "user@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
