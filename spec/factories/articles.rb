FactoryBot.define do
  factory :article do
    title { "CoronaVirus" }
    teaser { "Sweden is free of Coronavirus" }
    content { "blahblahblha blahblah blah" }
    article_class { 0 }
    new_created_at { Time.now.strftime('%d-%m-%Y') }
  end
end
