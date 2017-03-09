class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tea = Tea.find(params[:tea_id])
    @review = @tea.reviews.new(review_params)
    if @tea.save
      flash[:notice] = "Review Posted."
    else
      flash[:alert] = "Error: invalid Entry"
    end
    redirect_to tea_path(@tea)
  end

  def destroy
    if current_user&.admin
      @review = Review.find(params[:id])
      @review.destroy
      flash[:notice] = "Review Deleted Successfully."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Admin Access Only."
      redirect_back(fallback_location: root_path)
    end
  end


private
  def review_params
    params.require(:review).permit(:title, :content, :stars, :user_id, :tea_id)
  end
end