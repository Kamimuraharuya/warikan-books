Rails.application.routes.draw do
	post "signup" => "users#create" #エラー時に良くわからん
	get "signup" => "users#new"

	root 'book#home'
	get 'help'    => 'book#help'
	get 'about'   => 'book#about'
	get 'contact' => 'book#contact'

	resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
