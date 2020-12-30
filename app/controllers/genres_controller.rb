class GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index ]
  before_action :search_product, only: [:show]


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
    @item1 = @genre.items.includes(:genre).where(status_id: 2).order("created_at DESC")
    @item2 = @genre.items.includes(:genre).where(status_id: 3).order("created_at DESC")
    @item3 = @genre.items.includes(:genre).where(status_id: 4).order("created_at DESC")
    redirect_to action: :index if @genre.user_id != current_user.id 
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
      redirect_to action: :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :quantity_id, :status_id, :release_date, :purchase_date).merge(user_id: current_user.id, genre_id: params[:genre_id])
  end

  def genre_params
    params.require(:genre).permit(:theme, :image, :set_amount).merge(user_id: current_user.id)
  end

  def search_product
    @genre = Genre.find(params[:id])
    @item = @genre.items.includes(:genre)
    @p =  @item.ransack(params[:q])
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

    helper_method :all_purchase_price_month
    def all_purchase_price_month
        array = {}
        @item = Item.all
        @user = current_user.id
        @purchase = @item.where(status_id: '2', user_id: @user)
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

    helper_method :all_purchase_price
    def all_purchase_price
      array = {}
      @user = current_user.id
      @items =Item.all
      @purchase = @items.where(status_id: '2', user_id: @user)
      @purchase.each do |item|
      array[item.price ] = item.quantity_id
      end
      array.map {|key, val| key * val }.sum
  end

  helper_method :all_concern_price
    def all_concern_price
      array = {}
      @user = current_user.id
      @items =Item.all
      @purchase = @items.where(status_id: '4', user_id: @user)
      @purchase.each do |item|
      array[item.price ] = item.quantity_id
      end
      array.map {|key, val| key * val }.sum
  end

  helper_method :all_must_price
    def all_must_price
      array = {}
      @user = current_user.id
      @items =Item.all
      @purchase = @items.where(status_id: '3', user_id: @user)
      @purchase.each do |item|
      array[item.price ] = item.quantity_id
      end
      array.map {|key, val| key * val }.sum
  end

    helper_method :all_set_amount
    def all_set_amount
        array = []
        @genre = Genre.all
        @user = current_user.id
        @purchase = @genre.where(user_id: @user)
        @purchase.each do |genre|
        array << genre.set_amount
        end
        array.sum
    end

  end
