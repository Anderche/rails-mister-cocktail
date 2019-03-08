Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
  # PREVENT homepage from being http://localhost:3000/cocktails. Call the Index page as the root directly, as below:
	root to: 'cocktails#index'

	# INDEX would now be a duplicate route so must "hide" from routes.rb by calling "except:" as below:
  resources :cocktails, except: :index do
  	# resources :doses, only: [:new, :create, :destroy]
  	resources :doses
  end
  	resources :doses, only: [:destroy]
end
