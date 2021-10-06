Rails.application.routes.draw do
  devise_for :users
  devise_for :property_owners
  root to: 'home#index'
  resources :properties, only: %i[index show new create] do
    get 'my_properties', on: :collection
    resources :property_reservations, only: %i[create show], shallow: true
  end
  resources :property_types, only: [:show]
end
