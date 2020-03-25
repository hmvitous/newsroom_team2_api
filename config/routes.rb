# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  namespace :api do
    authenticated :user, ->(u) { u.journalist? || u.admin?  } do
      resources :articles, only: [:create], constraints: { format: 'json' }
    end
    resources :articles, only: %i[index show], constraints: { format: 'json' }
  end
end
