# frozen_string_literal: true

RSpec.describe 'GET /api/articles', type: :request do
  describe 'GET /articles' do
    let!(:articles) { create(:article) }
    before do
      get '/api/articles'
    end

    it 'should return a 200 response' do
      expect(response.status).to eq 200
    end
  end

  describe 'GET, No articles been found' do
    before do
      get '/api/articles'
    end

    it 'No articles been found' do
      expect(response.status).to eq 404
    end
  end
end
