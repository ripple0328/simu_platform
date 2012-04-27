Platform::Application.routes.draw do
  
  get "maps/index"

  get "plot/index"

  get "simulation/index"
  post "simulation/index"
  get "hosts/new"
  get "sessions/new"
  get "simulation/upload"
  post "simulation/upload"
  get "simulation/download"
  post "simulation/download"
  get "simulation/download_template"
  post "simulation/download_result"

  ##  match "user/auth/:id", :to => 'users#auth'
  
  resources :users do
    member do 
      post 'auth'
    end
    
  end
  resources :sessions, :only => [:new, :create, :destroy ]

  
  match '/help',      :to => 'pages#help'
  match '/contact',   :to => 'pages#contact'
  match '/about',     :to => 'pages#about'
  match '/signin' ,   :to => 'sessions#new'
  match '/signout',   :to => 'sessions#destroy'
  match '/signup' ,   :to => 'users#new'
  match '/simulation',:to => 'simulation#index'
  match '/status',    :to => 'pages#status'
  match '/lookup',    :to => 'simulation#lookup'
  match '/plot',      :to => 'plot#index', :as => :plot
  match '/map',       :to => 'maps#index',:as => :map
  root :to => 'pages#input'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
