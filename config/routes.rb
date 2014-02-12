HumanResourcesManagement::Application.routes.draw do
  
  resources :projects do
    get "projects_content", on: :member
  end

  resources :teams
  
  resources :manage_team do
      get "teams_content", on: :member
  end
  resources :calendar_types

  resources :schedule_carwashes

  resources :day_offs

  resources :employees

  get "home/index"
  get "manage_team/index"

  get 'generateSchedule', to: 'schedule_carwashes#generateSchedule'
  match 'generateSchedule', to: 'schedule_carwashes#generateSchedule',:via =>[:get, :post]

  get 'prevMonth',to:'home#prevMonth'
  get 'nextMonth' ,to:'home#nextMonth'

  get 'byday_birthdate', to: 'employees#byday_birthdate'
  get 'byday_schedule_carwash', to: 'schedule_carwashes#byday_schedule_carwash'
  get 'byday_day_off', to: 'day_offs#byday_day_off'

  get 'dashboard_day', to: 'home#dashboard_day'
  
  get 'manage_team', to: 'manage_team#index'

  get 'add_remove_team', to: 'employees#add_remove_team'

  get 'teams_edit/:id', to: 'manage_team#teams_edit'
  get 'update_team', to: 'manage_team#update_team'
  patch 'update_team/:id' => 'manage_team#update_team'

  get 'teams_new', to: 'manage_team#teams_new'
  get 'create_team', to: 'manage_team#create_team'
  post 'create_team' => 'manage_team#create_team'

  get 'employees_new', to: 'employees#employees_new'
  get 'create_employee', to: 'employees#create_employee'
  post 'create_employee' => 'employees#create_employee'

  get 'destroy_team/:id', to: 'manage_team#destroy_team'

  get 'projects_new', to: 'manage_team#projects_new'
  get 'create_project', to: 'manage_team#create_project'
  post 'create_project' => 'manage_team#create_project'

  get 'projects_edit/:id', to: 'manage_team#projects_edit'
  get 'update_project', to: 'manage_team#update_project'
  patch 'update_project/:id' => 'manage_team#update_project'

  get 'destroy_project/:id', to: 'manage_team#destroy_project'

  

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
