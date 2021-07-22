Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: :show
  resouces :plans
  root 'plans#index'
end
