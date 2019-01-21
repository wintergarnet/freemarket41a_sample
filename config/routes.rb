Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations"}

  root 'items#index'

  resources :users do
    get :logout
    get :choice, on: :collection
    post :follow, on: :member
    get :telephone

    get :telephone_confirm
    get :nickname_email_confirm

    get 'users' => 'users#new'
    get :profile

    resources :items, shallow: true do

      get :show_more
      get :transaction

      get :detail

      collection do
        get :list
        get :set_midium_categories
        get :set_small_categories
      end

      member do
        post :pay, controller: :credits, action: :pay, as: 'pay'
      end

    end

  end

  resources :addresses do
    get :credit_registration
    post :create
  end

  resources :credits, only: [:new, :create, :edit] do
    collection do
      get :acquire_token
    end
  end
end
