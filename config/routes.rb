Rails.application.routes.draw do

    root 'homes#top'
    devise_for :users
    resources :books, only: [:new, :create, :index, :show, :destroy]
    resources :users, only: [:new, :create, :index, :show, :edit, :update]
    resources :home, only: [:top, :show, :crete]
end
