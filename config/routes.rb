Palantir::Application.routes.draw do
    root to: 'developments#index'

    resources :developments, only: [:new, :create]

    devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

    devise_scope :user do
        get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
        get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
    end
end
