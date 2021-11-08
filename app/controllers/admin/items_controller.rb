class Admin::ItemsController < ApplicationController
  def index
    @items = Item.search(params[:search])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def edit 
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to admin_items_path
    else
       render :edit
    end
  end
  
  private
	def item_params
		params.require(:item).permit(:genre_id ,:name, :description, :no_tax_price, :is_active, :image)
	end
end
