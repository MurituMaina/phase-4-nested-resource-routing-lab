class UsersController < ApplicationController
  def index
  users = User.all
  if users
  render json: users, status: :ok
  else
  render json: { message: "No users found" }, status: :not_found
  end
  end

  def show
    if params[:item_id]
    user = User.find(params[:item_id])
    else
    user = User.find(params[:id])
    end
    render json: user, include: :items
  end

 

end
