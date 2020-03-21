Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: %i[index show ], constraints: { format: 'json' }

    post 'articles/create'
    resources :articles, only: %i[create] 
  end
end
