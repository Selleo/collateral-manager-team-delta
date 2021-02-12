Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :collaterals, only: [:show, :index, :create]
      resources :tags, only: [:show, :index, :create]
    end
  end
end


  # devise_for :tags
  #   get 'api/v1/tags/index'
  #   post 'api/v1/tags/add'
  # end

