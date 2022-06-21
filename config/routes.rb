Rails.application.routes.draw do
  require "sidekiq/web"
  require 'sidekiq/cron/web'
  
  devise_for :users
  get 'home/index'
  get 'home/debit'
  get 'home/profile'
  root 'home#index'


  authenticated :user do
    mount Sidekiq::Web => "/sidekiq"
    resources :cards do
      get 'test', on: :collection
      collection { post :import }
      resources :billings
      end
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
