require 'rails_helper'
require 'factory_bot'
RSpec.describe 'Get/api/articles/', type: :request do
    let!(:articles){create(:article, title: "coronavirus", teaser: "The World goverments cannot manage it", content: "it's spreading all around the world")}
    let!(:articles){create(:article, title: "coronavirus 1", teaser: "The World goverments cannot at all manage it", content: "it's spreading all around the world like fire")}

    describe 'GET/articles' do
        # create(:article, title: 'A breaking news item', content: 'Some random content')
        # create(:article, title: 'Some really breaking action', content: 'Some random content')
        # @article = Article.new(title: "Corona is viral", teaser: "Is there something you can do?", content: "NO. sorry there isn't.")
        # @article = Article.new(title: "Corona is killing", teaser: "Is there something you cannot do?", content: "NO. please,sorry there isn't.")

            before do
        get '/api/articles/2'
        end

    it 'should return a 200 response' do
        expect(response.status).to eq 200
    end
 end
end


