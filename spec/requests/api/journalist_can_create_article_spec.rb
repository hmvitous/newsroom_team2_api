RSpec.describe Api::ArticlesController, type: :request do
let(:article) {create(:article)}

    describe 'POST /api/articles_controller' do
    before do
        post '/api/articles/create',
        params: {
            article: {
                title: "Redbull gives you wings"
                teaser: "It's improves productivity for programmers"
                content: "Coders are buying Redbull to improve their performance while coding, business are against this practices!"
            },
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