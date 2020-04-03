RSpec.describe 'POST /articles', type: :request do
  let(:journalist) { create(:user, role: 'journalist') }
  let(:journalist_credentials) { journalist.create_new_auth_token }
  let(:journalist_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(journalist_credentials) }

  let(:image) do
    {
      type: 'application/jpg',
      encoder: 'name=new_iphone.jpg;base64',
      data: 'iVBORw0KGgoAAAANSUhEUgAABjAAAAOmCAYAAABFYNwHAAAgAElEQVR4XuzdB3gU1cLG8Te9EEgISQi9I71KFbBXbFixN6zfvSiIjSuKInoVFOyIDcWuiKiIol4Q6SBVOtI7IYSWBkm',
      extension: 'jpg'
    }
  end

  describe "with valid params" do
    before do
      post "/api/articles",
      params: {
        article: {
          title: 'Coronavirus',
          teaser: 'Things are bad',
          content: 'It will get worse.',
          article_class: 'free',
          image: image
        }
      },
      headers: journalist_headers
    end

    it 'return a 200 response' do
      expect(response.status).to eq 200
    end

    it 'returns a success message' do
      expect(response_json["message"]).to eq 'Your article is ready for review.'
    end

    it 'article has an image' do
      article = Article.where(title: response.request.params["article"]["title"])
      expect(article.first.image.attached?).to eq true
    end
    
    
  end

end