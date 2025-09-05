Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :books, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :loans, only: [:create, :update]

  post "users/create", as: :login, to: "users#create"
  get "users/new", as: :login_page
  get "/signup", to: "users#new", as: :signup
   post "/users", to: "users#create"

  get 'books/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

    # 貸出・返却処理
    resources :loans, only: [:create] do
      post 'return_book', on: :collection
    end
  
    # ダッシュボード
    get 'dashboard', to: 'users#dashboard'
  
    # ログイン・ログアウト
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  
    resources :books, only: [:index, :show]
    resources :loans, only: [:create, :update]

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"


end
