Rails.application.routes.draw do

  scope :module => 'buttercms' do
    get '/categories/:slug' => 'categories#show', :as => :buttercms_category
    get '/author/:slug' => 'authors#show', :as => :buttercms_author

    get '/blog/rss' => 'feeds#rss', :format => 'rss', :as => :buttercms_blog_rss
    get '/blog/atom' => 'feeds#atom', :format => 'atom', :as => :buttercms_blog_atom
    get '/blog/sitemap.xml' => 'feeds#sitemap', :format => 'xml', :as => :buttercms_blog_sitemap

    get '/blog(/page/:page)' => 'posts#index', :defaults => {:page => 1}, :as => :buttercms_blog
    get '/blog/:slug' => 'posts#show', :as => :buttercms_post
  end
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
