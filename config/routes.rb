Rails.application.routes.draw do
  resources :items, only: [:index, :show, :create, :update] 
  resources :users, only: [:show] do
    resources :items, only: [:index, :show,:create]
  end
end
