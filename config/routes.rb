Rails.application.routes.draw do

  mount Lines::Engine => "/blog"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations"}
  root to: 'pages#countdown'
  get "/home", to: "pages#home", as: "home"
  get "/about", to: "pages#about", as: "about"
  # get "/countdown", to: "pages#countdown", as: "countdown"
  get "/material", to: "pages#material", as: "material"
  get "/terms", to: "pages#terms", as: "terms"
  get "/faq", to: "pages#faq", as: "faq"
  get "/risk", to: "pages#risk", as: "risk"
  get "/coming-soon", to: "pages#coming_soon", as: "coming_soon"
  resources :subscribers, only: [:create, :new, :index]

  resources :enterprises do
    resources :offers, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
    resources :founders, only: [ :new, :create ]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy ]
  resources :offers, only: [ :show ] do
    resources :investments, only: [ :index, :new, :create ]
  end
  resources :investments, only: [ :show, :edit, :update, :destroy]
  resources :founders, only: [ :show, :edit, :update, :destroy ]
  get "/mywallet", to: "investments#wallet", as: "wallet"
  get "investments/:id/rejected", to: "investments#rejected", as: "rejected"
  get "/message", to: "messages#new", as: "message"
  post "messages", to: "messages#create"
  get 'offers',     to: 'offers#index'

end
