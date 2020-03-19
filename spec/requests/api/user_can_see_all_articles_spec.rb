RSpec.describe 'GET /api/articles', type: :request do
let!(:articles) {5.times {create(:article)}}

  describe 'GET /articles' do
    before do
      get '/api/articles'
    end

    it 'should return a 200 response' do
      expect(response.status).to eq 200
    end
  end
  
   describe 'GET /articles' do
    before do
      get '/api/articles'
    end

    it 'returns 5 articles' do
      binding.pry
      expect(JSON.parse(response.body)["articles"].count).to eq 5
    end
  end
end