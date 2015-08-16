Rails.application.routes.draw do
  devise_for :users
  resources :merchandise
  get '/merchandise/new', to: 'merchandise#new', as: 'merchandises'
  root to: 'merchandise#index'
end
