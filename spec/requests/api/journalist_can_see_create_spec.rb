# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'POST /api/articles', type: :request do
  let(:journalist) { create(:user, role: 'journalist') }
  let(:journalist_credentials) { journalist.create_new_auth_token }
  let(:journalist_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(journalist_credentials) }

  let(:registered_user) { create(:user, role: 'registered_user') }
  let(:registered_user_credentials) { registered_user.create_new_auth_token }
  let(:registered_user_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(registered_user_credentials) }

  let(:visitor_headers) { { HTTP_ACCEPT: 'application/json' }}

  describe 'With valid params from journalist role' do
    before do
      post '/api/articles',
      params: {
        article: {
          title:"test article",
          teaser:"test teaser",
          content: "test content"
        },
      },
      headers: journalist_headers
    end

    it 'should return a 200 response' do
      expect(response.status).to eq 200
    end

    it 'should return a success message' do
      expect(response_json["message"]).to eq "Your article is ready for review."
    end
  end

  describe 'Unsuccess with ' do
    describe 'With invalid params from journalist role' do
      before do
        post '/api/articles',
        params: {
          article: {
            title: 0,
            teaser:"",
            content: nil
          },
        },
        headers: journalist_headers
      end

      it 'returns status 406' do
      end
      it 'returns error message' do
      end
    end

    describe 'Visitor tries to create Article' do
      before do
        post '/api/articles',
        params: {
          article: {
            title:"test article",
            teaser:"test teaser",
            content: "test content"
          },
        },
        headers: visitor_headers
      end
      it 'returns status 406' do
      end
      it 'returns error message' do
      end
    end
    describe 'Register user tries to create Article' do
      before do
        post '/api/articles',
        params: {
          article: {
            title:"test article",
            teaser:"test teaser",
            content: "test content"
          },
        },
        headers: registered_user_headers
      end
      it 'returns status 406' do
      end
      it 'returns error message' do
      end
    end
  end
end
