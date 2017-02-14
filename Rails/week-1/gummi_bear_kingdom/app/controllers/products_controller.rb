class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    p @products

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params.except(:imagedata) )
    respond_to do |format|
      if @product.save
        save_product
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params.except(:imagedata))
        save_product
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def generate_file_name
      parts = params[:product][:imagedata].original_filename.split(".")
      "#{parts[0]}-#{Time.now.nsec}.#{parts[1]}"
    end

    def save_product
      if params[:product].key?(:imagedata)
        uploaded_io = params[:product][:imagedata]
        File.open(Rails.root.join('public', 'uploads', params[:product][:image]), 'wb') do |file|
          file.write(uploaded_io.read)
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      if params[:product].key?(:imagedata)
        params[:product][:image] = generate_file_name
      end
      params.require(:product).permit(:name, :cost, :origin, :image, :imagedata)
    end
end
