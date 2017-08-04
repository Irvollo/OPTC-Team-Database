Rails.application.routes.draw do
  
  resources :stages
  resources :searches
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

   # You can have the root of your site routed with "root"
  root 'searches#new'
  get '/home', to: 'static_pages#home' 
  get '/about', to: 'static_pages#about' 
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/search', to: 'searches#new'
  delete '/logout', to: 'sessions#destroy'
  

  resources :users
  #Get resources for the email activation
  resources :account_activations, only: [:edit]
  #Get to create new password resets and updating them
  resources :password_resets, only: [:new, :create, :edit, :update]
  #Run should only allow to create and destroy.
  resources :runs,          only: [:new, :create, :destroy]
  resources :runs do 
    member do
      put "like", to: "runs#upvote"
      put "dislike", to: "runs#downvote"
    end
  end
  
  #Get search resources
  resources :searches
    
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
