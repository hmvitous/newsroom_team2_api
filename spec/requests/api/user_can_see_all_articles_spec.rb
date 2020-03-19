require 'rails_helper'

RSpec.describe Api::ArticleController, type: :request do
  describe 'GET /articles' do
    before do
      get '/api/articles'
    end

    it 'should return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'should return Pong' do
      json_response = JSON.parse(response.body)

      expect(json_response['message']).to eq 'Pong'
    end
  end
end