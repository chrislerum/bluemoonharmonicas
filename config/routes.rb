BlueMoonHarmonicas::Application.routes.draw do
  root :to => 'Static#home'

  # Item with nested, sortable photos
  resources :items do
    resources :photos do
      put :sort, on: :collection
    end
  end

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

  # Static pages
  match '/newsletter' => 'Static#newsletter', as: :newsletter
  match '/about' => 'Static#about', as: :about

  resources :products, controller: 'items' # FIXME this resource is unnecessary

  # Named routes
  match 'cart' => 'carts#show', as: :current_cart

  match 'categories/:category_id' => 'Items#index', as: :category_list

  match 'account' => 'Users#show', as: :account, id: 'current'
  match 'account/edit' => 'Users#edit', as: :edit_account, id: 'current'

  match '/login' => 'Sessions#new', as: :login
  match '/register' => 'Users#new', as: :registration
  match '/logout' => 'sessions#destroy', as: :logout

end
