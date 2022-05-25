Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :destroy]
      resources :articles, only: [:index, :create, :update, :destroy] do
        resources :comments, only: [:show, :create, :update, :destroy]
      end
    end
  end
end
