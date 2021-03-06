# frozen_string_literal: true

RSpec.describe 'Get/api/articles/', type: :request do
  describe 'GET/articles' do
    before do
      @article = FactoryBot.create(:article, title: 'Corona is viral', teaser: 'Is there something you can do?', content: "NO. sorry there isn't.")
      get "/api/articles/#{@article.id}"
    end

    it 'should return a valid article response' do
      expect(response.status).to eq 200
      expect(response_json['id']).to eq @article.id
      expect(response_json['title']).to eq @article.title
      expect(response_json['teaser']).to eq @article.teaser
      expect(response_json['content']).to eq @article.content
    end
  end

  describe 'GET/articles [sad path]' do
    before do
      get '/api/articles/2'
    end

    it 'should return a 404 response' do
      expect(response.status).to eq 404
    end

    it 'should return cannot find the desired article' do
      expect(response_json['error']).to eq "Couldn't find Article with 'id'=2"
    end
  end
end
