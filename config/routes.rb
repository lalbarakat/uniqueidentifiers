Uniqueidentifiers::Application.routes.draw do
  get "scan/new"

  get "sessions/new"

  get "welcome/index"
  get "home/index"
  get "reports/student" => 'reports#by_student'

  resources :items

  post 'checkouts/add_items' => 'checkouts#add_items'
  post 'checkouts/add_dates' => 'checkouts#add_dates'
  post 'checkouts/review' => 'checkouts#review'
  get 'checkouts/checkin' => 'checkouts#checkin'
  post 'checkouts/review_checkin' => 'checkouts#review_checkin'
  resources :checkouts


  resources :students


  resources :users
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
 
  get 'reports' => 'reports#index'
  get 'reports/all' => 'reports#all'
  get 'reports/checkoutdate/:month/:day/:year' => 'reports#by_checkout_date'
  get 'reports/returndate/:month/:day/:year' => 'reports#by_return_date'
  get 'reports/student_uin/:uin' => 'reports#by_student_uin'
  get 'reports/student_name/:firstname/:lastname' => 'reports#by_student_name'

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
   root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
