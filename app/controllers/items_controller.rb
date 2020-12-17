class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :search_product, only: [:search]

  def index
    @genres = Genre.all
    @item = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @genre = Genre.find(params[:genre_id])
    @item = Item.new(item_params)
    if @item.save
       redirect_to genre_path(@genre)
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:genre_id])
    @item = @genre.items.find(params[:id])
    redirect_to root_path if @item.user_id != current_user.id
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
    if @item.user_id == current_user.id
       @item.destroy
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  def search
    @genre = Genre.find(params[:genre_id])
    @item = @genre.items.all
    @results = @p.result
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :quantity_id, :status_id, :release_date, :purchase_date).merge(user_id: current_user.id, genre_id: params[:genre_id])
  end

  def search_product
    @genres = Genre.find(params[:genre_id])
    @p =  @genres.items.ransack(params[:q])
  end

  def total_price
  end

end