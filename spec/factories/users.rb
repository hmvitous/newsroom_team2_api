FactoryBot.define do
  factory :user do
    role { "admin" }
    name { "Thomas Blue" }
    email { "user@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
