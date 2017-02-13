Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

	get "login" => "sessions#new"
	post "login" => "sessions#create"
	delete "logout" => "sessions#destroy"
	

	get "signup" => "users#new"

	post "signup" => "users#create" #エラー時に良くわからん
	get "signup" => "users#new"

	root 'book#home'
	get 'help'    => 'book#help'
	get 'about'   => 'book#about'
	get 'contact' => 'book#contact'

	resources :users
	resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
