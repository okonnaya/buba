Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'pages#index'

  resources :responses, only: [:create, :destroy]
end
