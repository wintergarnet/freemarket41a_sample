Rails.application.routes.draw do

  devise_for :users

  root 'items#index'
  resources :items, only:[:index, :new, :create, :show, :edit] do
  end

  resources :users do
    get :logout
    get :choice, on: :collection
    post :follow, on: :member
    get :telephone
    get 'users' => 'users#new'
    get :profile
  end

  resources :addresses, only:[:new, :create]

end
