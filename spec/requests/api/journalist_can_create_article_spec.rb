RSpec.describe Api::ArticlesController, type: :request do
let!(:article) {create(:article)}

  describe 'POST /api/articles_controller' do
    before do
      post '/api/articles/create',
        params: {
            title: article.title,
            teaser: article.teaser,
            content: article.content
        }
    end

    it 'returns a 200 response status' do
        expect(response.status).to eq 200
    end

    it 'succesfully creates Article entry' do
        entry = Article.last
        expect(entry.article.title).to eq "Redbull gives you wings"
    end
  end
end