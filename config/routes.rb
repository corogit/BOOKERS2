Rails.application.routes.draw do
    devise_for :users
    root 'homes#top'
    resources :books, only: [:new, :create, :index, :show, :destroy]
    resources :users, only: [:new, :create, :index, :show, :edit, :update]
    resources :home, only: [:top, :show, :crete]
end
