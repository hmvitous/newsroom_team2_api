# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: %i[index show], constraints: { format: 'json' }
    post 'articles/create'
  end
end
