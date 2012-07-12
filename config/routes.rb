Citysandbox::Application.routes.draw do

  resources :betausers

  match 'project' => 'project#new'
  resources :project
  root :to => 'home#splash.html.haml', :as => :home

  get "welcome/show"
  match "welcome/show" => "welcome#show"
  get 'welcome/autocomplete_category_name'
  get "questions/autocomplete_category_name"
  match 'ugh' => 'welcome#show'
  scope :as => :home do
    get  '/' => 'home#splash', :as => :splash
    get '/login' => 'sessions#new', :as => :login
    get '/logout' => 'sessions#destroy', :as => :logout
    #get '/register' => 'users#new', :as => :register
    get '/register' => 'betausers#new', :as => :register
  end

  resources :sessions

  resources :categories

  resources :groups do
    get '/members' => "groups#members"
    get '/project' => "groups#project"
    get '/edit' => "groups#edit"
  end

  match '/users/validate' => 'users#validate'
  match "/vote" => "proposals#vote"
  match "/edit_profile" => "users#edit"
  match "/follow" => "discussion#follow"
  match "/unfollow" => "discussion#unfollow"
  match "/recent" => "users#recent"
  match "/qr" => 'discussion#qr'
  match "/validate" => 'users#validate'
  match "/users/profile/:id" => 'users#profile'
  match "fetch" => "discussion#filter"
  match "ugh" => "questions#auto"

  match '/groups/members' => "groups#members"
  match '/groups/project' => "groups#project"
  match '/groups/edit' => "groups#edit"

  resources :questions do
    match "/auto" => "questions#auto"
    get :auto_complete_for_category_name, :on => :collection
    get :auto_complete_category_name, :on => :collection
  end
  resources :challenges do
      get :auto_complete_for_category_name, :on => :collection
      get :auto_complete_category_name, :on => :collection
  end

  post "questions/auto_complete_for_category_name" => "questions#auto_complete_for_category_name"
  post "challenges/auto_complete_for_category_name" => "challenges#auto_complete_for_category_name"
  post "events/auto_complete_for_category_name" => "events#auto_complete_for_category_name"
  get "questions/autocomplete_category_name"
  get "events/autocomplete_category_name"
  get "challenges/autocomplete_category_name"

  resources :events do
    resources :response_events, :shallow => true
    get :auto_complete_for_category_name, :on => :collection
    get :auto_complete_category_name, :on => :collection
  end

  resources :discussion do
    get '/' => 'discussion#summary', :as => :summary
  end

  match 'filter' => 'discussion#filterNew'

  get '/summary' => 'discussion#summary', :as => :summary


  match "/map" => 'map#index', :as => :map
  match "/map/draw_map" => 'map#draw_map'
  match "/map/draw" => "map#draw"

  match "messages/sent" => "sent#show"
  match "messages/inbox" => "inbox#show"
  match "messages/new" => 'inbox#new'
  match "messages/create" => "inbox#create"

  # match "users/inbox/new" => "inbox#new"
  match "messages/reply/:id" => "inbox#respond", :as => :reply
  match "messages/send_to/:id" => "inbox#send_to", :as => :reply

  resources :users, :messages,  :inbox

  match "questionNew" => "questions#newForm"
  match "challengeNew" => "challenges#challengeNew"
  match "eventNew" => "events#eventNew", :as => :event_new
  match "confirm" => "map#drawMapConfirm"
  match "map2" => "map#drawMapBoxies"
  # scope "/users" do
  #   resources :mailbox
  #   resources :sent
  # end

 #remove this when ready to launch

  # resources :inbox do
  #     get '/index' => 'inbox#index', :controller => "inbox", :action => "index"
  #
  #     member do
  #       get 'respond'
  #     end
  #   end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with response_url(:id => response.id)

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
