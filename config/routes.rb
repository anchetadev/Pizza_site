Rails.application.routes.draw do
  get 'sessions/new'

  get 'menu' => 'users#menu'
 
  get '' => 'pizzas#index'
  get 'pizzas/new' => 'pizzas#new'
  post 'pizzas/new' => 'pizzas#create'
  get 'pizzas/:id/edit' => 'pizzas#edit'
  patch 'pizzas/:id' => 'pizzas#update'
  delete 'pizzas/:id' => 'pizzas#delete'
  
  get 'foods/new' => 'foods#new'
  post 'foods/new' => 'foods#create'
  get 'foods/:id/edit' => 'foods#edit'
  patch 'foods/:id' => 'foods#update'
  delete 'foods/:id' => 'foods#delete'

  get 'cart/pizza/:id' => 'users#remove_pizza'
  get 'cart/food/:id' => 'users#remove_food'
  get 'pizza_orders/:id' => 'users#pizza_order'
  get 'food_orders/:id' => 'users#food_order'
  get 'log_in' => 'users#new'
  post 'users' => 'users#create'
  get '/checkout' => 'users#checkout'

  post 'sessions/new' => 'sessions#user_create'
  delete ':id/destroy' => 'sessions#destroy'

  get 'admin' => 'users#admin' 
  post 'admin' => 'users#admin_create'
  get 'admin/orders' => 'users#admin_orders'
  delete 'order/:id' => 'users#finish'
  
  resources :charges
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
