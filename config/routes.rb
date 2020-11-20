Rails.application.routes.draw do

    root 'homes#top'
    devise_for :users
    resources :books, only: [:new, :create, :index, :show, :destroy]
    resources :users, only: [:new, :create, :index, :show, :edit, :update]
    
    get 'https://bookers-level2-v3-demo.herokuapp.com/' => 'homes#top', as: 'homes'
    resources :homes, only: [:top, :index]
end
