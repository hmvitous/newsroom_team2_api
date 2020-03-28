# frozen_string_literal: true

RSpec.describe Api::ArticlesController, type: :request do
  let(:journalist) { create(:user, role:'journalist') }  
  let(:journalist_credentials) { journalist.create_new_auth_token }
  let(:journalist_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(journalist_credentials) }

  describe 'Journalist creates an article' do
    before do
      post '/api/articles',
           params: {
             article: {
             title: 'Coronavirus',
             teaser: 'Things are bad',
             content: 'It will get worse.',
             article_class: "free"
             }
           },
           headers: journalist_headers
    end

    it 'returns a 200 response status' do
      expect(response.status).to eq 200
    end

    it 'succesfully creates Article entry' do
      entry = Article.last
      expect(entry.title).to eq 'Coronavirus'
    end
  end

    describe '[Sad path] Journalist creates an article' do
      before do
        post '/api/articles',
          params: {
            article: {
            title: 'Coronavirus',
            teaser: 'Things are bad',
            content: '',
            article_class: "premium"
            }
          },
          headers: journalist_headers
    end
    
    it 'returns a 406 response status' do
      expect(response.status).to eq 406
    end

    it 'does not create an Article entry' do
      expect(response_json["message"]).to eq 'Your article was not saved.'
    end
  end
end
