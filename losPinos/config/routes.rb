LosPinos::Application.routes.draw do

  get "contacts/new"
  get "contacts/create"
  get "contacts_controller/new"
  get "contacts_controller/create"
  get "checks/checkin"
  get "checks/checkout"
  # Pantalla principal
  root 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]

  resources :reservas do
    get "agregar_acompaniante" => :addclient
    collection do
        patch ':reserva_id/agregar_acompaniante', :action => 'addacompaniante'
    end
  end

  resources :reservas do
    post "confirmar" => :confirmar
  end

  resources :tipo_reservas

  resources :tarjeta

  resources :gastos

  resources :admin_users

  resources :habitacions

  resources :clientes

  controller :sessions do
    get 'login' => :new

    post 'login' => :create

    delete 'logout' => :destroy

    get 'logout' => :destroy
  end

  # Ejemplo de rutas personalizadas
 # match '/signin',  to: 'sessions#new',         via: 'get'
 # match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/home',  to: 'static_pages#home',         via: 'get'

  get '/control_habitaciones' => 'static_pages#control_habitaciones'
  get "/ultimas_reservas(.:format)" => "static_pages#ultimas"
  get "/reservas_display(.:format)" => "reservas#display"
  get "/habitaciones_estado(.:format)" => "habitacions#habitaciones_estado"

  put "/reservas_display/:id(.:format)" => "reservas#updateReservas"

  put "/reservas(.:format)" => "reservas#index"

  match '/contacts',     to: 'contacts#new',             via: 'get'
  
  resources "contacts", only: [:new, :create]



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
