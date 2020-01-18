class CategoriesController < ApplicationController
  # GET
  # /categories
  def index
  	categories = Category.all

  	render json: categories, status: :ok
  end

  # GET
  # /categories/:id
  def show
  	category = Category.find_by_id(params[:id])

  	if category.present?
  	  result = category.products
    else
      result = "Category not found!"
  	end

  	render json: result, status: :ok
  end

  # POST
  # /categories
  def create
  	category = Category.new(category_params)

  	if category.save
      result = 'Category was successfully created.'
    else
      result = "Something went wrong! while creating Category"
    end

    render json: result, status: :ok
  end

  private

    def category_params
      params.require(:category).permit(:name, :group, :model)
    end
end
