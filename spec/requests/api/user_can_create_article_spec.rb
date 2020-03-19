RSpec.describe 'POST /api/articles', type: :request do
let!(:article_1) {create(:article, title: "coronavirus", teaser: "The World goverments cannot manage it", content: "it's spreading all around the world")}
   
describe 'POST /articles' do
      before do
        post '/api/articles'
      end
  
      it 'should return a 200 response' do
        expect(response.status).to eq 200
      end

describe 'GET /'


      it 'should contain article' do
        expect(response_json['header']).to eq ''
    end
    end