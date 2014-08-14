class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @property_collection = {}
    @item.skus.map do |sku|
      sku.sku_properties.each do |property|
        @property_collection[property.stock_property_id] ||= {}
        @property_collection[property.stock_property_id][:name] = StockProperty.find(property.stock_property_id).name
        @property_collection[property.stock_property_id][:items] ||=[]
        @property_collection[property.stock_property_id][:items] << {
          id: property.stock_property_item_id,
          name: StockPropertyItem.find(property.stock_property_item_id).name
        }
      end
    end

    @total_inventory = @item.skus.sum(:inventory)

    # [{ id: 1, 2: 10, 3: 13, inventory: 25 }]
    @inventories = @item.skus.map do |sku|
      result = {id: sku.id, inventory: sku.inventory}
      sku.sku_properties.each do |property|
        result[property.stock_property_id] = property.stock_property_item_id
      end
      result
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params[:item]
    end
end
