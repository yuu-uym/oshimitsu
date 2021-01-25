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

  def show
    @bbs = Bbs.find(params[:id])
  end

  def edit
    @bbs = Bbs.find(params[:id])
    redirect_to action: :index if @bbs.user_id != current_user.id 
  end

  def update
    @bbs = Bbs.find(params[:id])
    if @bbs.update(bbs_params)
      redirect_to bbss_path
    else
      render :edit
    end
  end

  

  private
  def bbs_params
    params.require(:bbs).permit(:title, :overview).merge(user_id: current_user.id)
  end

end
