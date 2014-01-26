BlueMoonHarmonicas::Application.routes.draw do
  resources :videos

  resources :item_images

  root :to => 'static#home'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :items

  # Links and FAQs are sortable
  resources :links, except: [:show] do
    put :sort, on: :collection
  end

  resources :faqs, except: [:show] do
    put :sort, on: :collection
  end

  # Orders allows you to POST an express order
  resources :orders, except: [:index] do
    post :express, on: :collection
  end

  # Generic resources
  resources :users
  resources :line_items
  resource :session

  # static pages
  match '/newsletter' => 'static#newsletter', as: :newsletter
  match '/about' => 'static#about', as: :about

  resources :products, controller: 'items' # FIXME this resource is unnecessary

  # Named routes
  match 'cart' => 'carts#show', as: :current_cart

  match 'harp_models/:harp_model_id' => 'items#index', as: :harp_model_list

  match 'account' => 'users#show', as: :account, id: 'current'
  match 'account/edit' => 'users#edit', as: :edit_account, id: 'current'

  match '/login' => 'sessions#new', as: :login
  match '/register' => 'users#new', as: :registration
  match '/logout' => 'sessions#destroy', as: :logout
end
