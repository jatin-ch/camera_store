class ProductsController < ApplicationController
  # GET
  # /products
  def index
  	products = Product.all

  	render json: products, status: :ok
  end

  # POST
  # /products
  def create
  	product = Product.new(product_params)

  	if product.save
      result = 'Product was successfully created.'
    else
      result = "Something went wrong! while creating Product"
    end

    render json: result, status: :ok
  end

  private

    def product_params
      params.require(:product).permit(:name, :category_id, :description, :price, :make)
    end
end
