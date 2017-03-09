class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @day = Food.where(user_id: current_user.id).where(date: Time.now)
  end

end
