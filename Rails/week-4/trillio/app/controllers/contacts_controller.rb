class ContactsController < ApplicationController
  before_action :set_contact, :only => [:show, :edit, :destroy, :update]

  def index
    @contacts = Contact.all
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "You've got yourself a new contact!"
      redirect_to contacts_path
    else
      flash[:alert] = "Error. Error. Error."
      redirect_to 'new'
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      flash[:notice] = "You've got a friend in #{@contact.name}. (Contact Updated)"
      redirect_to @contact
    else
      flash[:alert] = "Error. Error. Error."
      redirect_to :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end

private
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :number)
  end
end
