# frozen_string_literal: true

RSpec.describe Api::ArticlesController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'POST /api/articles_controller' do
    before do
      post '/api/articles',
           params: {
             article: {
             title: 'Coronavirus',
             teaser: 'Things are bad',
             content: 'It will get worse.',
             premium_article: 0
             }
           },
           headers: headers
    end

    it 'returns a 200 response status' do
      expect(response.status).to eq 200
    end

    it 'succesfully creates Article entry' do
      entry = Article.last
      expect(entry.title).to eq 'Coronavirus'
    end
  end

    describe '[Sad path] POST /api/articles_controller' do
      before do
        post '/api/articles',
          params: {
            article: {
            title: 'Coronavirus',
            teaser: 'Things are bad',
            content: '',
            premium_article: 1
            }
          },
          headers: headers
    end
    
    it 'returns a 206 response status' do
      expect(response.status).to eq 406
    end

    it 'does not create an Article entry' do
      expect(response_json["message"]).to eq 'Your article was not saved.'
    end
  end
end
