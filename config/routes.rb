Rails.application.routes.draw do
    root 'homes#top'
    get "home/about" => "homes#about"

    devise_for :users
    resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
        resource :favorites, only: [:create, :destroy]
        resources :book_comments, only: [:create, :destroy]
    end
    resources :users, only: [:new, :create, :index, :show, :edit, :update]

end
