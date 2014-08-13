class Admin::ShopsController < ApplicationController
	before_action :authrize_shop!
	before_action :shop_checking

	def index
	end

	def show
	end

	protected
		def shop_checking
			shop = Shop.find(params[:id])
	    if shop != current_shop
	      respond_to do |format|
	        format.html { render text: "Permistion denied! You dont own this shop", status: 401 }
	      end
	    end
		end
end