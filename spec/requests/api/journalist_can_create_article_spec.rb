RSpec.describe Api::ArticlesController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'POST /api/articles_controller' do
    before do
      post '/api/articles/create',
        params: {
            title: "Redbull gives you wings0",
            teaser: "Redbull gives you wings1",
            content: "Redbull gives you wings2"
        },
        headers: headers
    end

    it 'returns a 200 response status' do
      binding.pry
      expect(response.status).to eq 200
    end

    it 'succesfully creates Article entry' do
        entry = Article.last
        expect(entry.article.title).to eq "Redbull gives you wings"
    end
  end
end