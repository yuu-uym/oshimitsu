class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def message_params
    params.require(:genre).permit(:theme, :image).merge(user_id: current_user.id)
  end
end
