BlueMoonHarmonicas::Application.routes.draw do
  root :to => 'static#home'
  resources :harmonica_images
  resources :powder_coated_cover_images
  resources :material_types
  resources :brands
  resources :harmonicas
  resources :powder_coated_covers
  resources :combs
  resources :keys
  resources :colors
  resources :videos
  resources :comb_images
  resources :harmonica_images
  resources :powder_coated_cover_images

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :links, except: [:show] do
    put :sort, on: :collection
  end
  resources :faqs, except: [:show] do
    put :sort, on: :collection
  end
  resources :orders, except: [:index] do
    post :express, on: :collection
  end
  resources :users
  resources :line_items
  resource :session
  match '/newsletter' => 'static#newsletter', as: :newsletter
  match '/about' => 'static#about', as: :about
  resources :products, controller: 'items' # FIXME this resource is unnecessary
  match 'cart' => 'carts#show', as: :current_cart
  match 'models/:model_id' => 'combs#index', as: :model_list
  match 'account' => 'users#show', as: :account, id: 'current'
  match 'account/edit' => 'users#edit', as: :edit_account, id: 'current'
  match '/login' => 'sessions#new', as: :login
  match '/register' => 'users#new', as: :registration
  match '/logout' => 'sessions#destroy', as: :logout
end
