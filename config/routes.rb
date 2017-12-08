Rails.application.routes.draw do
  devise_for :users

  root "messages#index"
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :new, :create]
  end
  resources :users, only: [:edit , :update]
end
