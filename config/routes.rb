Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations"}

  root 'items#index'
  resources :items, only:[:index, :new, :create, :show, :edit] do
  end

  resources :users do
    get :logout
    get :choice, on: :collection
    post :follow, on: :member
    get :telephone
    get :telephone_confirm
    get :nickname_email_confirm
    # get 'users' => 'users#new'
  end

  resources :addresses do
    get :credit_registration
    post :create
  end

end
