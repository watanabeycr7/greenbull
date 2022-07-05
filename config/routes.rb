Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: 'schedules#index'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :groups
  resources :schedules, only: [:index, :new, :create, :show, :edit]
end
