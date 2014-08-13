class CategoriesController < ApplicationController
  before_action :setup_category, only: [:show, :edit, :update]

  def index
    @categories = Category.all
  end

  def show
  end

  def edit
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_path(@category) }
      else
        format.html { render text: @category.errors.to_json }
      end
    end
  end

  def update
  end

  def destroy
  end

  protected
    def setup_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
