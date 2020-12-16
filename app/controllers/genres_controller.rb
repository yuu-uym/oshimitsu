class GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @genres = Genre.all
    @items =  Item.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @genre = Genre.find(params[:id])
    @items = @genre.items.includes(:genre)
  end

  def edit
    @genre = Genre.find(params[:id])
    redirect_to action: :index if @genre.user_id != current_user.id 
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genre_path
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.user_id == current_user.id
      @genre.destroy
      redirect_to root_path
    else
      edirect_to action: :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :quantity_id, :status_id, :release_date, :purchase_date).merge(user_id: current_user.id, genre_id: params[:genre_id])
  end

  def genre_params
    params.require(:genre).permit(:theme, :image, :set_amount).merge(user_id: current_user.id)
  end

  helper_method :purchase_price
    def purchase_price
        array = {}
        @genre = Genre.find(params[:id])
        @item = @genre.items.includes(:genre)
        @purchase = @item.where(status_id: '2')
        @purchase.each do |item|
        array[item.price ] = item.quantity_id
        end
        array.map {|key, val| key * val }.sum
    end

    helper_method :purchase_price_month
    def purchase_price_month
        array = {}
        @genre = Genre.find(params[:id])
        @item = @genre.items.includes(:genre)
        @purchase = @item.where(status_id: '2')
        @purchase_month = @purchase.where('purchase_date LIKE(?)', "%#{Time.now.month}%")
        @purchase_year = @purchase_month.where('purchase_date LIKE(?)', "%#{Time.now.year}%")
        @purchase_year.each do |item|
        array[item.price ] = item.quantity_id
        end
        array.map {|key, val| key * val }.sum
    end

    helper_method :must_price
    def must_price
        array = {}
        @genre = Genre.find(params[:id])
        @item = @genre.items.includes(:genre)
        @purchase = @item.where(status_id: '3')
        @purchase.each do |item|
        array[item.price ] = item.quantity_id
        end
        array.map {|key, val| key * val }.sum
    end

    helper_method :concern_price
    def concern_price
        array = {}
        @genre = Genre.find(params[:id])
        @item = @genre.items.includes(:genre)
        @purchase = @item.where(status_id: '4')
        @purchase.each do |item|
        array[item.price ] = item.quantity_id
        end
        array.map {|key, val| key * val }.sum
    end
  end
