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

  def genre_params
    params.require(:genre).permit(:theme, :image, :set_amount).merge(user_id: current_user.id)
  end
end
