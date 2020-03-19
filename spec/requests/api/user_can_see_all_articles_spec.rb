RSpec.describe 'GET /api/articles', type: :request do
  describe 'GET /articles' do
    before do
      get '/api/articles'
    end

    it 'should return a 200 response' do
      expect(response.status).to eq 200
    end

    it 'should return a header' do
      expect(response_json['header']).to eq 'Pong'
    end

    it 'should return a content' do
      expect(response_json['content']).to eq 'blablabla.'
    end

    it 'should return a teaser' do
      expect(response_json['teaser']).to eq "I'm your father."
    end
  end
end
