Rails.application.routes.draw do
  get 'mypage/show'

  #ユーザ認証
  devise_for :users, controllers: {
    registration: "devise/registrations",
    session: "users/sessions"
  }
  resources :mypage, only: [:show]

  #管理者承認
  devise_for :admins, controllers: {
    registration: "admins/registrations",
    session: "admins/sessions"
  }
  resources :adminpagein, only: [:show]

  #注文関連
  resources :orders, only: [:new, :create] do
    collection do
      get :confirm
    end

    member do
      get :complete
    end
  end

  get 'books/new'
  post 'books', to: 'books#create'     #登録
  get 'books', to: 'books#index'
  get 'books/:id', to: 'books#show', as: 'book'
  get 'books/:id/edit', to: 'books#edit', as: 'edit_book'
  patch 'books/:id', to: 'books#update'
  delete 'books/:id', to: 'books#destroy', as: 'destroy_book'
  root to: 'homes#top'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
