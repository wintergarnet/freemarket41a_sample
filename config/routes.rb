Rails.application.routes.draw do

  devise_for :users

  root 'items#index'
  resources :items, only:[:index, :new, :create, :show] do
  end


  resources :users do
    get :choice, on: :collection
    post :follow, on: :member
  end



end
