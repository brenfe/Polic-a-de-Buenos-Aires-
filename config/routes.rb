Rails.application.routes.draw do
  resources :trial_employees
  devise_for :users
  resources :trials
  resources :reports
  resources :damages
  resources :properties
  resources :employees
  resources :policemen
  resources :police_stations
  resources :defendants
  resources :complainants
  resources :people
  resources :addresses
  resources :cities
  resources :provinces
  resources :categories
  root 'reports#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
