class GenresController < ApplicationController
  def index
  end

  def message_params
    params.require(:genre).permit(:theme, :image).merge(user_id: current_user.id)
  end
end
