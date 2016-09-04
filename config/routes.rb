Rails.application.routes.draw do



	namespace :admin do 
		resources :admins
		resources :articles
		resources :users
		resources :categories
	end
  get 'admin/login', to: 'admin/admins#new'
  post 'admin/login', to: 'admin/admins#create'

  resources :users
	resources :articles	do
	  resources :comments
	end

	get 'sessions/login', to: 'sessions#new'
  post 'sessions/login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
