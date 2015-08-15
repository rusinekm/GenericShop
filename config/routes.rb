Rails.application.routes.draw do
  devise_for :users
  resources :merchandise
  root to: 'merchandise#index'
end
