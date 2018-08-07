Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations"}
  root to: 'pages#home'

  get "/coming-soon", to: "pages#coming_soon", as: "coming_soon"
  resources :subscribers, only: [:create, :new, :index]

  resources :enterprises do
    resources :offers, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
    resources :founders, only: [ :new, :create ]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy ]
  resources :offers, only: [ :show ]
  resources :founders, only: [ :show, :edit, :update, :destroy ]

end
