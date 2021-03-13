FactoryBot.define do
  factory :note do
    title { Faker::Quote.famous_last_words }
    content { Faker::TvShows::RickAndMorty.quote }
    priority { 'low' }
    user
  end
end