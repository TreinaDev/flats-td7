Rails.application.routes.draw do
  devise_for :users
  devise_for :property_owners
  root to: 'home#index'
  get 'my_profile', to: 'users#my_profile'

  resources :properties, only: %i[index show new create] do
    get 'my_properties', on: :collection
    resources :property_reservations, only: %i[create show], shallow: true do
      post 'accept', on: :member
    end
  end
  resources :property_types, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :properties, only: %i[index show]
    end
  end
end
