Rails.application.routes.draw do
	get "/microposts/tatiage" => "microposts#tatiage"

	get '/auth/:provider/callback',    to: 'users#create',       as: :auth_callback
	get '/auth/failure',               to: 'users#auth_failure', as: :auth_failure

	
	get "login" => "sessions#new"
	post "login" => "sessions#create"
	delete "logout" => "sessions#destroy"


	post "signup" => "users#create" #エラー時に良くわからん
	get "signup" => "users#new"

	root 'book#home'
	get 'help'    => 'book#help'
	get 'about'   => 'book#about'
	get 'contact' => 'book#contact'

	resources :chats
	
	resources :users
	resources :account_activations, only: [:edit]
	resources :password_resets,     only: [:new, :create, :edit, :update]
	resources :microposts    
	resources :microposts do

		resources :likes, only: [:create, :destroy]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
