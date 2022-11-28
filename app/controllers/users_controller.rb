class UsersController < ApplicationController
  def index
  users = User.all

  render json: users, status: :ok

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
