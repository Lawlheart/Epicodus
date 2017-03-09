class MessagesController < ApplicationController
  before_action :get_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
    @contacts = Contact.all
    @weather_object = FindHumidity.new("97210")
    @humidity = @weather_object.get_humidity()
  end

  def new
    @message = Message.new
  end

  def show

  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Saved!"
      redirect_to root_path
    else
      render 'new'
    end
  end

private
  def get_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
