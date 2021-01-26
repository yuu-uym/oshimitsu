class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/boards/#{comment.board.id}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to "/boards/#{@comment.board.id}"
    else
      redirect_to "/boards/#{@comment.board.id}"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, board_id: params[:board_id])
  end
end
