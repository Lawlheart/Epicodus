class TeasController < ApplicationController
  before_action :set_tea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @teas = Tea.all
  end

  def new
    @tea = Tea.new
  end

  def create
    @tea = Tea.new(tea_params)
    if @tea.save
      flash[:notice] = "Your tea has been successfully saved."
      redirect_to teas_path
    else
      flash[:alert] = "Something prevented your tea from being saved."
      redirect_to new_tea_path
    end
  end

  def update
    if @tea.update(tea_params)
      flash[:notice] = "Your tea has been successfully updated."
      redirect_to tea_path(@tea)
    else
      flash[:alert] = "Something prevented your tea from being updated."
      redirect_to edit_tea_path(@tea)
    end
  end

  def destroy
    @tea.destroy
    flash[:notice] = "Your tea has been successfully deleted."
    redirect_to teas_path
  end

  private
  def authenticate_user!
    if current_user&.admin
      true
    elsif current_user
      flash[:alert] = "Access Denied."
      redirect_to '/'
    else
      flash[:alert] = "You need to log in."
      redirect_to new_user_session_path
    end
  end

  private
  def set_tea
    @tea = Tea.find(params[:id])
  end

  def tea_params
    params.require(:tea).permit(
        :name, :description, :instructions,
        :price, :caffeine, :flavor, :tea_type)
  end

end