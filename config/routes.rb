Rails.application.routes.draw do
  devise_for :users
  devise_for :property_owners
  root to: 'home#index'
  resources :properties, only: [:index, :show, :new, :create] do
    get 'my_properties', on: :collection
  end
  resources :property_types, only: [:show]
end
