class BbssController < ApplicationController

  def index
    @bbss = Bbs.all
  end

  def new
    @bbs = Bbs.new
  end
  
  def create
    @bbs = Bbs.new(bbs_params)
    if @bbs.save
      redirect_to bbss_index_path
    else
      render :new
    end
  end

  private
  def bbs_params
    params.require(:bbs).permit(:title, :overview).merge(user_id: current_user.id)
  end
end
