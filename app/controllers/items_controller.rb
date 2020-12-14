class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :quantity_id, :status_id, :release_date, :purchase_date).merge(user_id: current_user.id, genre_id: params[:genre_id])
  end
end