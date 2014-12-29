BlueMoonHarmonicas::Application.routes.draw do
  resources :custom_htmls
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
  resources :sub_customization_kits

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
  match '/list_users' => 'static#list_users', as: :list_users
  resources :products, controller: 'items' # FIXME this resource is unnecessary
  match 'cart' => 'carts#show', as: :current_cart

  match 'combs_models/:model_id' => 'combs#index', as: :combs_model_list
  match 'harmonicas_models/:model_id' => 'harmonicas#index', as: :harmonicas_model_list
  match 'powder_coated_covers_models/:model_id' => 'powder_coated_covers#index', as: :powder_coated_covers_model_list
  match 'sub_customization_kits_models/:model_id' => 'sub_customization_kits#index', as: :sub_customization_kits_model_list

  match 'account' => 'users#show', as: :account, id: 'current'
  match 'account/edit' => 'users#edit', as: :edit_account, id: 'current'
  match '/login' => 'sessions#new', as: :login
  match '/register' => 'users#new', as: :registration
  match '/logout' => 'sessions#destroy', as: :logout
  match '/search_results' => 'search#results', as: :search_results
end
