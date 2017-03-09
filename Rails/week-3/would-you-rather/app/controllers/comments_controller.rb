class CommentsController < ApplicationController

  def new
    @choice = Choice.find(params[:choice_id])
  end

  def create
    @choice = Choice.find(params[:choice_id])
    @comment = @choice.comments.new(comment_params)
    if @choice.save
      respond_to do |format|
        format.html { redirect_to choice_path(@comment.choice) }
        format.js
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

private
  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
