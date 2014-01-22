Vivorbi::Application.routes.draw do

  
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "startpage" => "events#startpage", :as => "startpage"
  get "eigen" => "events#owns", :as => "owns"
  get "uitnodigingen" => "events#invites", :as => "invites"
  get "openbaar" => "events#public", :as => "public"
  get "management" => "dashboards#management", :as => "management"
  get "commercieleactiviteiten" => "hotspots#index", :as => "hotspots"

  	resources :users do
  		resources :events
  		end
  	resources :users
  	resources :sessions 
	resources :events do
			member do
				get 'follow'
				delete 'unfollow' 
			end
		end

	resources :participants
	resources :dashboards do
		resources :events
		end
    
    resources :events do
        resources :comments
      end
      
     resources :hotspots
		
  get 'dashboards/active/:id', to: "dashboards#active"
  get 'dashboards/inactive/:id', to: "dashboards#inactive"
	

root "events#startpage"

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
