class UsersController < ApplicationController
  # GET
  # /users/logged_in
  def logged_in
    if current_user.present?
      result = "User exist!!"
    else
      result = 'User not logged in!'
    end

    render json: result, status: :ok
  end

  # POST
  # /users/signup
  def create
    user = User.new(user_params)

    if user.save
      result = 'User was successfully created.'
    else
      result = "Error while creating user"
    end

    render json: result, status: :ok
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
