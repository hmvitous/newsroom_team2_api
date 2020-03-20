# frozen_string_literal: true

RSpec.describe 'Get/api/articles/', type: :request do
  describe 'GET/articles' do
    @article = Article.create(title: "Corona is viral", 
        teaser: "Is there something you can do?", content: "NO. sorry there isn't.")
    @article = Article.create(title: "Corona is defeated!!", 
        teaser: "We are saved?", content: "NO! Recession is coming next!")
        
    before do
      get '/api/articles/2'
    end

    it 'should return a 200 response' do
      expect(response.status).to eq 200
    end
  end
end
