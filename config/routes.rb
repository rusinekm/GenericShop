Rails.application.routes.draw do
  devise_for :users
  resources :merchandise
  get '/merchandise/new', to: 'merchandise#new', as: 'merchandises'
  get '/payu/ok' => 'payu#ok'
  get '/payu/error' => 'payu#error'
  get '/payu/report' => 'payu#report'
  root to: 'merchandise#index'
end
