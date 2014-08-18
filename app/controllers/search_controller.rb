class SearchController < ApplicationController
  def index
  	@search_conditions = []
    @url_data = {prop: {}}
    @filter_conditions = {}

  	@category_id = params[:cat]
  	@brand = params[:brand]
  	@props = params[:prop]

  	@items = Item.all

  	unless @category_id.blank?
  		@items = @items.joins(product: :category).where("categories.id = ?", @category_id)
  		@search_conditions << Category.find(@category_id).name
      @url_data[:cat] = @category_id

      category = Category.find(@category_id)
      category.properties.each do |property|
        @filter_conditions[property.id] ||= {}
        @filter_conditions[property.id][:name] = property.name
        @filter_conditions[property.id][:items] = property.property_items.map do |item|
          {id: item.id, name: item.name}
        end
      end
  	end

	  unless @props.blank?
  		@items = @items.where("product_id in (?)", prop_product_ids)
  	end
  end

  protected
  	def prop_product_ids
  		product_ids = []
      init = true
      puts "|||------>#{@props}-------"
  		prop_pairs = @props.split(';')
  		prop_pairs.each do |pair|
  			key, value = pair.split(':')
        @url_data[:prop] ||= {}
        @url_data[:prop][key.to_sym] = value
        if init
          product_ids = ProductProperty.where(property_id: key, property_item_id: value).pluck(:product_id)
          init = false
          puts "1==> #{product_ids}===#{init}"
        else
          fits = ProductProperty.where(property_id: key, property_item_id: value).pluck(:product_id)
          product_ids &= fits
          puts "2==> #{product_ids}===#{fits}"
        end
  			@search_conditions << PropertyItem.find(value).name
  		end
      puts "==> #{product_ids}==="
	  	product_ids
  	end
end
