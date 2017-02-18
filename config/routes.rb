Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "admin/dashboard#index"

  namespace :api do
    resources :users
    resources :teams, :only => [:index, :create, :update]
    resources :matches, :only => [:create, :show]
    resources :games, :only => [:update]
    post '/matches/:id/games', to: 'games#create'
  end

end
