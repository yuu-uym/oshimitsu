class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to action: :index if @item.user_id != current_user.id 
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to genre_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :quantity_id, :status_id, :release_date, :purchase_date).merge(user_id: current_user.id, genre_id: params[:genre_id])
  end