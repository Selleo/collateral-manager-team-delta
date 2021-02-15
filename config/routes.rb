Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :collaterals, only: [:show, :index, :create, :update, :destroy]
      resources :tags, only: [:index, :create, :update]
      resources :collaterals_kind, only: [:index, :create, :update]
    end
  end
end


