class SessionsController < ApplicationController
  # POST
  # /sessions/create
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      result = "User Logged in!"
    else
      result = "Email or password is invalid"
    end

    render json: result, status: :ok
  end
  
  # GET
  # /sessions/destroy
  def destroy
    session[:user_id] = nil
    result = "User Logged out!"

    render json: result, status: :ok
  end
end
