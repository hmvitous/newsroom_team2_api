# frozen_string_literal: true

RSpec.describe Api::ArticlesController, type: :request do
  let(:journalist) { create(:user, role: 'journalist') }
  let(:journalist_credentials) { journalist.create_new_auth_token }
  let(:journalist_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(journalist_credentials) }

  let(:user) { create(:user, role: 'registered_user') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }

  let(:visitor) { create(:user, role: '') }
  let(:visitor_headers) { { HTTP_ACCEPT: 'application/json' } }

  let(:image) do
    {
      type: 'application/jpg',
      encoder: 'name=new_iphone.jpg;base64',
      data: 'iVBORw0KGgoAAAANSUhEUgAABjAAAAOmCAYAAABFYNwHAAAgAElEQVR4XuzdB3gU1cLG8Te9EEgISQi9I71KFbBXbFixN6zfvSiIjSuKInoVFOyIDcWuiKiIol4Q6SBVOtI7IYSWBkm',
      extension: 'jpg'
    }
  end

  describe 'Journalist creates an article' do
    before do
      post '/api/articles',
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
               article_class: 'premium'
             }
           },
           headers: journalist_headers
    end

    it 'returns a 406 response status' do
      expect(response.status).to eq 406
    end

    it 'does not create an Article entry' do
      expect(response_json['message']).to eq 'Your article was not saved.'
    end
  end

  describe 'Registered user tries to creates an article' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: 'Coronavirus',
               teaser: 'Things are bad',
               content: 'It will get worse.',
               article_class: 'free'
             }
           },
           headers: user_headers
    end

    it 'returns a 401 response status' do
      expect(response.status).to eq 401
    end

    it 'returns not authorize message ' do
      expect(response_json['message']).to eq 'You are not authorized.'
    end
  end

  describe 'Visitor tries to creates an article' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: 'Coronavirus',
               teaser: 'Things are bad',
               content: 'It will get worse.',
               article_class: 'free'
             }
           },
           headers: visitor_headers
    end

    it 'returns a 401 response status' do
      expect(response.status).to eq 401
    end
  end
end
