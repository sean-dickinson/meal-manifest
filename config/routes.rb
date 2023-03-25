Rails.application.routes.draw do
  resources :meals
  devise_for :users

  root "meals#index"
end
