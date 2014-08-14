class Admin::ItemsController < ApplicationController
	before_action :authrize_shop!
	before_action :shop_checking

	def index
	end

	def show
	end

	def categories
		@categories = Category.all
	end

	def products
		category = Category.find(params[:category_id])
		@products = category.products
	end

	def new
		@product = Product.find(params[:product_id])
		@category = @product.category
		@item = current_shop.items.build(product_id: @product.id)

		@line_items = @category.stock_properties.map do |p|
      p.stock_property_items.map { |item| { name: item.name, id: item.id, property_id: p.id } }
    end
	end

	def edit
	end

	def create
		@item = current_shop.items.build(item_params)

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

	def update
	end

	def destroy
	end

	protected
		def shop_checking
			shop = Shop.find(params[:shop_id])
	    if shop != current_shop
	      respond_to do |format|
	        format.html { render text: "Permistion denied! You dont own this shop", status: 401 }
	      end
	    end
		end

		def item_params
			params.require(:item).permit(:shop_id, :product_id,
        skus_attributes: [:price, :inventory,
        	sku_properties_attributes: [:stock_property_item_id, :stock_property_id]])
		end
end