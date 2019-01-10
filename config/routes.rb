Rails.application.routes.draw do

  devise_for :users
  resources :users do
    get :choice, on: :collection
    post :follow, on: :member
    get 'users' => 'users#show'
    get 'users' => 'users#new'
  end
  # root 'users#choice'
  # root 'items#index'

end
