Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :reviews do
    resources :comments
  end

  resources :registrations

  resources :users

  root 'reviews#index'
end
