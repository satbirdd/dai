class StockPropertiesController < ApplicationController
  before_action :set_stock_property, only: [:show, :edit, :update, :destroy]
  before_action :setup_category, only: [:index, :new, :create]

  # GET /stock_properties
  # GET /stock_properties.json
  def index
    @stock_properties = StockProperty.all
  end

  # GET /stock_properties/1
  # GET /stock_properties/1.json
  def show
  end

  # GET /stock_properties/new
  def new
    @stock_property = StockProperty.new
  end

  # GET /stock_properties/1/edit
  def edit
  end

  # POST /stock_properties
  # POST /stock_properties.json
  def create
    @stock_property = @category.stock_properties.build(stock_property_params)

    respond_to do |format|
      if @stock_property.save
        format.html { redirect_to @stock_property, notice: 'Stock property was successfully created.' }
        format.json { render :show, status: :created, location: @stock_property }
      else
        format.html { render :new }
        format.json { render json: @stock_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_properties/1
  # PATCH/PUT /stock_properties/1.json
  def update
    respond_to do |format|
      if @stock_property.update(stock_property_params)
        format.html { redirect_to @stock_property, notice: 'Stock property was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_property }
      else
        format.html { render :edit }
        format.json { render json: @stock_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_properties/1
  # DELETE /stock_properties/1.json
  def destroy
    @stock_property.destroy
    respond_to do |format|
      format.html { redirect_to stock_properties_url, notice: 'Stock property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_property
      @stock_property = StockProperty.find(params[:id])
    end

    def setup_category
      @category = Category.find(params[:category_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_property_params
      params.require(:stock_property).permit(:name, stock_property_items_attributes: [:name])
    end
end