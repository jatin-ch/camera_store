Rails.application.routes.draw do

  scope :api, defaults: {format: 'json'} do
  	# Get cart for a specific user
  	get 'carts/:user_id' => 'carts#show'
  	# Add product to cart
    post 'carts' => 'carts#create'
    
    # Product add new & list all 
    resources :products, only: [:index, :create]

    # Category add new, list all and show all products for a specific category
    resources :categories, only: [:index, :show, :create]

    # User login
    post 'sessions/create'
    # User logout
    get 'sessions/destroy'

    # Logged in user check
    get 'users/logged_in' => 'users#logged_in'
    # Sign up
    post 'users/signup' => 'users#create'
  end
end
