class CategoriesController < ApplicationController
  def index
	@category=Category.all
  end
  
  def new
    @category = Category.new
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
 
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end
  def show
  	@category = Category.find(params[:id])
  end
  def create
  	 @category = Category.new(category_params)
  	 @category.save
     redirect_to @category
  end
  def destroy
     @category = Category.find(params[:id])
	 @category=@category.destroy
	 
     redirect_to category_path

  end
  private
  def category_params
    params.require(:category).permit(:name, :parent_category_id)
  end
end

