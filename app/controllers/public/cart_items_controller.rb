class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_end_user.cart_items
  end

  def create
     @cart_item = current_end_user.cart_items.new(cart_item_params)
    @update_cart_item =  current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
    # params_cart_item[:item_id]
    # @cart_item.item_id
    # where.find_by.find

    if @update_cart_item.present?
        @cart_item.amount += @update_cart_item.amount
        @update_cart_item.destroy
    end
    
    @cart_item.save
    redirect_to cart_items_path
    # else
    #   @item = Item.find(params[:cart_item][:item_id])
    #   @cart_item = CartItem.new

    
  end

  def update
    @cart_items = current_end_user.cart_items.find(params[:id])
    @cart_items.update(params_cart_item)
    redirect_to cart_items_path
  end

  def all_destroy
    cart_items = current_end_user.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    cart_items = current_end_user.cart_items.find(params[:id])
    cart_items.destroy
    redirect_to cart_items_path
  end
  
private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
end

end
