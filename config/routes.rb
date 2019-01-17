Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  resources :users do
    get :logout
    get :choice, on: :collection
    post :follow, on: :member
    get :telephone
    get 'users' => 'users#new'
    get :profile

    resources :items, shallow: true do
      collection do
        get :list
        get :set_midium_categories
      end
      collection do
        get :detail
      end
    end

  end

  resources :addresses, only:[:new, :create]

end
