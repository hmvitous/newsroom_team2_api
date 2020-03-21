# frozen_string_literal: true

RSpec.describe Api::ArticlesController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'POST /api/articles_controller' do
    before do
      post '/api/articles/create',
           params: {
             title: 'Coronavirus',
             teaser: 'Things are bad',
             content: 'It will get worse.'
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
end
