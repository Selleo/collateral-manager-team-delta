Rails.application.routes.draw do
  root :to => redirect('/admin')
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      resources :collaterals, only: [:show, :index, :create, :update, :destroy]
      resources :tags, only: [:index, :create, :update, :destroy]
      resources :collateral_kinds, only: [:index, :create, :update, :destroy]
      resources :leads, only: [:index, :show, :create]
    end
  end
end


