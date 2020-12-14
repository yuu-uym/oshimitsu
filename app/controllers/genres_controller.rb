class GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @genres = Genre.all
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

  def genre_params
    params.require(:genre).permit(:theme, :image, :set_amount).merge(user_id: current_user.id)
  end
end
