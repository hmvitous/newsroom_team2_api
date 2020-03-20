Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: [:index], constraints: { format: 'json' }
  end
end