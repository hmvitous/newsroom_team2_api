FactoryBot.define do
  factory :article do
    title { "CoronaVirus" }
    teaser { "Sweden is free of Coronavirus" }
    content { "blahblahblha blahblah blah" }
    premium_article { true }
  end
end
