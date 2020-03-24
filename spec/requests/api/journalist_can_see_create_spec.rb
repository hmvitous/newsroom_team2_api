# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'POST /api/articles', type: :request do
  describe 'POST /articles Journalist' do
    before do
      user = FactoryBot.create(:user,  role: 'journalist')
      sign_in user
      post '/api/articles'
    end

    it 'should return a 204 response' do
      expect(response.status).to eq 204
    end
  end

  describe 'POST /articles Admin' do
    before do
      user = FactoryBot.create(:user,  role: 'admin')
      sign_in user
      post '/api/articles'
    end

    it 'should return a 204 response' do
      expect(response.status).to eq 204
    end
  end


  describe 'POST /articles registered_user' do
    before do
      user = FactoryBot.create(:user)
      sign_in user
      post '/api/articles'
    end

    it 'should return a 200 response' do
      binding.pry
      expect(error.message).to eq "blabla"
    end
  end


end
