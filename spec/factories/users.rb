FactoryBot.define do
  factory :user do
    role { "journalist" }
    name { "Thomas Blue" }
    email { "user@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
