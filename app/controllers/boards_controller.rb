class BoardsController < ApplicationController

  def index
    @boards = Board.all.order("created_at DESC")
  end

  def new
    @board = Board.new
  end
  
  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order("created_at DESC")
  end

  def edit
    @board = Board.find(params[:id])
    redirect_to action: :index if @board.user_id != current_user.id 
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    if @board.user_id == current_user.id
      @board.destroy
      redirect_to boards_path
    else
      redirect_to action: :index
    end
  end

  def search
    @boards = Board.search(params[:keyword])
  end

  private
  def board_params
    params.require(:board).permit(:title, :overview).merge(user_id: current_user.id)
  end

end
