class CommentsController < ApplicationController
  def new
    @link = Link.find(params[:link_id])
    @comment = Comment.new
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    if @comment.save
      flash[:message] = 'Comment Posted'
      redirect_to link_path(@link)
    else
      flash[:error] = 'Error: Invalid Entry!'
      render :new
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content, :username)
  end
end