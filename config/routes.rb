Rails.application.routes.draw do
  resources :delivery_slip_processings do   
    get 'delete'
  end
  resources :delivery_slips do   
    get 'delete'
  end
  resources :maintenance_reports do   
    get 'delete'
  end
  resources :work_orders do   
    get 'delete'
  end
  resources :maintenance_requests do   
    get 'delete'
  end
  resources :providers do   
    get 'delete'
  end
  resources :prestators
  resources :stations do   
    get 'delete'
  end
  resources :order_statuses
  resources :client_types
  resources :unavailabilities
  resources :task_statuses
  resources :tasks do 
    get 'delete'
  end
  resources :orders do   
    get 'delete'
  end
  resources :customers do
	  get 'delete'
  end
  resources :order_types do   
    get 'delete'
  end
  resources :motifs do 
    get 'delete'
  end 
  resources :companies
  resources :roles
  resources :services do
	
		get 'delete'
	
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


   # Home route.
   #root to: "home#index"

   get 'dashboard' => 'dashboard#index', as: :dashboard


	#get "/customers" => "customers#index", as: :customers_index

	#get "/companies"     => "companies#index", as: :all_companies 


	get "/users"     => "custom_users#index", as: :all_users 

	get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 

	post "/users/new"     => "custom_users#create", as: :create_user
	get "/users/new"     => "custom_users#new", as: :new_user
	get "/user/edit/:id" => "custom_users#edit", as: :edit_user

	patch "/user/update/:id" => "custom_users#update", as: :udapte_user

	#get "/commissions/settings/new"     => "commission_settings#new", as: :new_commission_setting
	#get "/commissions/settings/edit/:id" => "commission_settings#edit", as: :edit_commission_setting

	delete "/user/destroy/:id" => "custom_users#destroy", as: :destroy_user
	get "/credits/delete/:id" => "credits#delete", as: :delete_credit
	
	delete "/credits/destroy/:id" => "credits#destroy", as: :destroy_credit
	get "/user/delete/:id" => "custom_users#delete", as: :delete_user

	#get "/accounts/delete/:id" => "accounts#delete", as: :delete_account
	#delete "/accounts/destroy/:id" => "accounts#destroy", as: :destroy_account

	get "/user/enable/:id" => "custom_users#get_enable", as: :get_enable_user_account
	post "/user/enable/:id" => "custom_users#post_enable", as: :post_enable_user_account

	get "/user/disable/:id" => "custom_users#get_disable", as: :get_disable_user_account
	post "/user/disable/:id" => "custom_users#post_disable", as: :post_disable_user_account

	get "/user/update/:id" => "custom_users#update", as: :update_user

	#get "/settings/mail" => "mail_configurations#settings", as: :mail_settings

	#get "/user/show/:id" => "custom_users#show", as: :show_user
	#post "/logs/import" => "logs#import", as: :import_file
	get "/companies/:id" => "companies#show", as: :show_company
	get "/profile/settings" => "profiles#settings", as: :profile_settings

	

  # Devise routes.

  
  devise_for :users, path: '', controllers: { 
    registrations: "users/registrations",
    confirmations: 'users/confirmations',
    passwords: "users/passwords",
    sessions: "users/sessions"
        
    }, 
    path_names: {
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '' 
    }

    #root 'config_options#new'
	devise_scope :user do
		authenticated :user do
			root 'dashboard#index', as: :authenticated_root
		end

		unauthenticated do
			root 'users/sessions#new', as: :unauthenticated_root
		end
    end
    

    %w( 404 422 500 ).each do |code|
		get code, :to => "errors#show", :code => code
	end
end
