Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'rooms/index'
  get 'rooms/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'user/bookings', to: 'bookings#index', as: 'user_bookings'

  resources :rooms, only: [:index, :show] do
    resources :bookings, only: [:new, :create, :show, :index]
  end

end
