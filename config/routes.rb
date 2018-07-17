Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#maybe payment needs to be nested above
  get "/adm-painel", to: "pages#adm_painel", as: "adm_painel"

  get "/coming-soon", to: "pages#coming_soon", as: "coming_soon"
  resources :subscribers, only: [:create, :new, :index]

  resources :posts

end
