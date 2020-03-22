Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: %i[index show], constraints: { format: 'json' }
  end
end
