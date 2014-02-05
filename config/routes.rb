HumanResourcesManagement::Application.routes.draw do
  resources :projects do
    get "projects_content", on: :member
  end

  resources :teams do
      get "teams_content", on: :member
  end

  get "home/index"

  get 'generateSchedule', to: 'schedule_carwashes#generateSchedule'
  match 'generateSchedule', to: 'schedule_carwashes#generateSchedule',:via =>[:get, :post]
  get 'prevMonth',to:'home#prevMonth'
  get 'nextMonth' ,to:'home#nextMonth'
  get 'byday_birthdate', to: 'employees#byday_birthdate'
  get 'byday_schedule_carwash', to: 'schedule_carwashes#byday_schedule_carwash'
  get 'byday_day_off', to: 'day_offs#byday_day_off'
  get 'dashboard_day', to: 'home#dashboard_day'
  get 'manage_team', to: 'teams#manage_team'
  get 'add_remove_team', to: 'employees#add_remove_team'
  get 'teams_edit/:id', to: 'teams#teams_edit'
  get 'update_team', to: 'teams#update_team'
  patch 'update_team/:id' => 'teams#update_team'
  get 'teams_new', to: 'teams#teams_new'
  get 'create_team', to: 'teams#create_team'
  post 'create_team' => 'teams#create_team'

  resources :calendar_types

  resources :schedule_carwashes

  resources :day_offs

  resources :employees

  root 'home#index'

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
