Rails.application.routes.draw do
  get 'subscribers/new'
  devise_for :users, controllers: { registrations: "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bookings, only:[:new, :create, :show, :edit, :update] do
    member do
      get 'traveller' , to: "bookings#traveller"
      get 'confirmation', to: "bookings#confirmation", as: "confirmation"
    end
  end

#maybe payment needs to be nested above
  resources :bookings, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  get "/coming-soon", to: "pages#coming_soon", as: "coming_soon"
  resources :subscribers, only: [:create, :new]

end
