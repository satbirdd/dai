class SearchController < ApplicationController
  def index
  	category_id = params[:cat]
  	brand = params[:brand]
  	prop = params[:prop]

  	@items = Item.all

  	unless category_id.blank?
  		@items = @items.joins(product: :category).where("categories.id = ?", category_id)
  	end
  end
end
