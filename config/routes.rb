Olimpicos::Application.routes.draw do
 
  resources :users

  resources :deportes

  resources :eventos

  resources :medallas

  resources :registro_records

  resources :entrenadores

  resources :jugadores

  resources :equipos

  resources :disciplinas

  resources :delegaciones

  resources :sectores

  resources :estadios 

  resources :olimpiadas


match 'HallOfFame' => 'hall_of_fame#index', :as => 'hall_of_fame'

##basics
#jugadorEquipo
match 'jugadoresEquipos/:jugadores/:equipos' => 'jugadores_equipos#new', :as => 'new_jugadoresequipos'
match 'jugadoresEquipos/d/:jugadores/:equipos' => 'jugadores_equipos#delete', :as => 'delete_jugadoresequipos'


#jugador disciplina

match 'jugadores/agregar/:jugadores/:disciplina' => 'jugadores#add', :as => 'agregar_disciplina'
match 'jugadores/retirar/:id' => 'jugadores#remove', :as => 'retirar_disciplina'


# participante en un evento

match 'evento/agregar/:player/:id' => 'eventos#add', :as => 'new_membereventos'
match 'evento/retirar/:player/:id' => 'eventos#remover', :as => 'delete_membereventos'
match 'eventos/marca/:evento/:id/:marca' => 'eventos#score', :as => 'score_membereventos'


#auditoria
match 'auditoria' => 'auditoria#index', :as => 'auditoria'


match 'mundial' => 'eventos#mundial', :as => 'mundial'

 # match '/jugadoresEquipos/eliminar/:jugadoresEquipos' => 'jugadoresEquipos#destroy'

  root :to => 'static#home'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
