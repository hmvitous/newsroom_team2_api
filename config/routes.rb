Rails.application.routes.draw do
  get 'articles/index'
  namespace :api do
    resources :articles, only: [:index], constraints: { format: 'json' }
  end
end