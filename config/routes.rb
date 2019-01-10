Rails.application.routes.draw do

  devise_for :users
  resources :users do
    get :choice, on: :collection
    post :follow, on: :member
    get :telephone
    get 'users' => 'users#new'
  end

  root 'items#index'

end
