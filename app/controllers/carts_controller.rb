class CartsController < ApplicationController
  # GET
  # /carts/:user_id
  def show
  	cart = Cart.find_by(user_id: params[:user_id])

  	if cart.present?
      if cart.products.present?
        result = cart.products
      else
        result = 'Your cart is empty!'
      end
	  else
      result = "Cart not found"
	  end

	render json: result, status: :ok
  end

  # POST
  # /carts
  def create
  	#logged in user check!
  	if logged_in?
  	  cart = Cart.new(cart_params)

  	  if cart.save
  	  	result = "Products added to cart!"
  	  else
  	  	result = "Error while adding products to your cart"
  	  end
  	else
  	 result = "User must logged in!"
  	end

  	render json: result, status: :ok
  end

  private
    def cart_params
      params[:cart][:user_id] = current_user.id
      params.require(:cart).permit(:user_id, :product_ids => [])
    end
end
