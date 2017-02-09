class LinksController < ApplicationController
  def index
    if params[:sortby]
      if params[:sortby] == 'hot'
        @links = Link.order(:upvotes => :desc)
      elsif params[:sortby] == 'latest'
        @links = Link.order(:created_at => :desc)
      elsif params[:sortby] == 'trending'
        @links = Link.order(:upvotes => :desc, :created_at => :desc)
      end
    else
      @links = Link.order(:upvotes => :desc)
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = 'List successfully added!'
      redirect_to link_path(@link)
    else
      flash[:error] = 'Error: Invalid Entry!'
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    p link_params
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:notice] = 'List successfully updated!'
      redirect_to links_path
    else
      flash[:error] = 'Error: Invalid Entry!'
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = 'List successfully deleted!'
    redirect_to links_path
  end

private
  def link_params
    params.require(:link).permit(:name, :url, :username, :upvotes)
  end
end