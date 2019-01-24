Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations"}

  root 'items#index'

  get 'items/search' => 'items#search'
  get 'items/advanced_search' => 'items#advanced_search'
  get 'items/set_midium_category' => 'items#set_midium_category'
  get 'items/set_small_category' => 'items#set_small_category'

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

      collection do
        get :list
        get :trade
        get :sold
      end

      member do
        patch :destroy
      end

      member do
        get :detail
        get :transaction
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
