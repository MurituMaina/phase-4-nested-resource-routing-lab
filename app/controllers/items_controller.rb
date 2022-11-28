class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else
      items = Item.all
    end 

    render json: items, include: :user
  end

  def show
    item = Item.find(params[:id])
    if item
      render json: item, include: :user
    else
      render json: "Item not found", status: 404
    end
  end

def create
  item = Item.create!(params_item)
  if item
    render json: item, status: :created
  else
    render json: item, status: :not_found
  end
end
private

def params_item
  params.permit(:name, :description, :price, :user_id)
end

def render_not_found_response
  render json: { error: "Item not found" }, status: :not_found
end

end
