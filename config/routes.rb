Rails.application.routes.draw do
  root 'items#index'
  get 'items', to: 'items#mypage'
end
