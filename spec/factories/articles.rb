FactoryBot.define do
  factory :article do
    title { "CoronaVirus" }
    teaser { "Sweden is free of Coronavirus" }
    content { "blahblahblha blahblah blah" }
    article_class { 0 }
  end
end
