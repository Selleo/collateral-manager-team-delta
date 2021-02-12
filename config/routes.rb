Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :collaterals, only: [:show, :index, :create, :update, :destroy]
      resources :tags, only: [:show, :index, :create]
    end
  end
end


