class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :current_shop

  def authrize_shop!
  	if current_user.shop.blank?
  		respond_to do |format|
  			format.html { render text: "Permistion denied! You dont have a shop", status: 401 }
  		end
      return
  	end
  end

  def current_shop
    @shop ||= current_user.shop
  end
end
