FactoryBot.define do
  factory :user do
    role { "registered_user" }
    name { "Thomas Blue" }
    email { "user@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
