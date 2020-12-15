class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

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
    @genre = Genre.find(params[:genre_id])
    @item = @genre.items.find(params[:id])
    redirect_to action: :index if @genre.user_id != current_user.id 
  end

  def update
    @genre = Genre.find(params[:genre_id])
    @item = @genre.items.find(params[:id])
    if @item.update(item_params)
      redirect_to genre_path(@genre)
    else
      render :edit
    end
  end


  def destroy
    @genre = Genre.find(params[:genre_id])
    @item = @genre.items.find(params[:id])
    if @item.destroy
       redirect_to genre_path(@genre)
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :quantity_id, :status_id, :release_date, :purchase_date).merge(user_id: current_user.id, genre_id: params[:genre_id])
  end

  def total_price
  end

end