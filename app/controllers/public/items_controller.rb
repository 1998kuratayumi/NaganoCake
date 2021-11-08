class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id] == nil
      @items = Item.where(is_active: true)
    else
      @items = Item.where(genre_id: params[:genre_id])
    end
    
    @genres = Genre.all
  end

  def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.new
  end

end
