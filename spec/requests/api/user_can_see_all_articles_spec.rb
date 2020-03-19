RSpec.describe 'GET /api/articles', type: :request do
let!(:article_1) {create(:article, title: "coronavirus", 
teaser: "The World goverments cannot manage it", content: "it's spreading all around the world")}

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

    it 'should contain articles_1' do
      expect(response_json['title']).to eq "coronavirus"
   end
   it 'should contain articles_1' do
    expect(response_json['teaser']).to eq "The World goverments cannot manage it"
 end

 it 'should contain articles_1' do
    expect(response_json['content']).to eq "it's spreading all around the world"
 end
end


