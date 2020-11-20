Rails.application.routes.draw do
    devise_for :users
    root 'homes#top'

    resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :users, only: [:new, :create, :index, :show, :edit, :update]


    resources :homes, only: [:top, :index]
end
