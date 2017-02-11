Rails.application.routes.draw do
    get "signup" => "users#new"

	root 'book#home'
	get 'help'    => 'book#help'
	get 'about'   => 'book#about'
	get 'contact' => 'book#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
