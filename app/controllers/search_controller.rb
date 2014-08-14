class SearchController < ApplicationController
  def index
  	@search_conditions = []
  	@category_id = params[:cat]
  	@brand = params[:brand]
  	@props = params[:prop]

  	@items = Item.all

  	unless @category_id.blank?
  		@items = @items.joins(product: :category).where("categories.id = ?", @category_id)
  		@search_conditions << Category.find(@category_id).name
  	end

	  unless @props.blank?
  		@items = @items.where("product_id in (?)", prop_product_ids)
  	end
  end

  protected
  	def prop_product_ids
  		product_properties = ProductProperty.all

  		prop_pairs = @props.split(';')
  		prop_pairs.each do |pair|
  			key, value = pair.split(':')
  			product_properties = product_properties.where(property_id: key, property_item_id: value)
  			@search_conditions << PropertyItem.find(value).name
  		end

	  	product_properties.pluck(:product_id)
  	end
end
