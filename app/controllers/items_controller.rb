class ItemsController < ApplicationController

  def index
  	#Item.create(:name => 'Sony Xperia T', :price_unit =>'35000', :available_quantity => '10', :description => '4G LTE', :state =>'Activated')
    @item = Item.all
  end
  def new
    @item = Item.new
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
 
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end
  def show
  	@item = Item.find(params[:id])
  end
  def create
  	 @item = Item.new(item_params)
  	 @item.save
     redirect_to @item
  end
  def destroy
     @item = Item.find(params[:id])
	 @item=@item.destroy
	 
     redirect_to items_path

  end

  private
  def item_params
    params.require(:item).permit(:name, :price_unit, :available_quantity, :description, :state)
  end


end
