class ChoicesController < ApplicationController
  before_action :set_choice, only: [:show, :destroy]

  def index
    @choices = Choice.all
  end

  def show

  end

  def new
    @choice = Choice.new
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save
      respond_to do |format|
        format.html { redirect_to choice_path(@choice), notice: "Choice Saved Successfully." }
        format.js
      end
    else
      flash[:alert] = "There was a problem creating your choice. Please try again."
      redirect_to new_choice_path
    end
  end

  def destroy
    @choice.destroy
    flash[:notice] = "Your choice has been successfully deleted."
    redirect_to choices_path
  end

private
  def set_choice
    @choice = Choice.find(params[:id])
  end

  def choice_params
    params.require(:choice).permit(:title, :description, :option_a, :option_b)
  end

end
