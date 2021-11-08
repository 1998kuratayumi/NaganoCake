class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  	@ship_addresses = Address.where(end_user_id: current_end_user.id)
  end

  def index
    @orders = current_end_user.orders
  end

  def create
    @order = current_end_user.orders.new(order_params)
    @order.save
    current_end_user.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.no_tax_price
      order_detail.order_id = @order.id
      order_detail.save
    end
    current_end_user.cart_items.destroy_all
    redirect_to thanks_orders_path
  end

  def log
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
     @order = Order.new(
      end_user_id: current_end_user.id,
      payment_method: params[:payment_method].to_i
    )
    if  params[:select_address] == "0"
      @order.ship_postal_code = current_end_user.zip_code
      @order.ship_address     = current_end_user.address
      @order.ship_name        = current_end_user.last_name+current_end_user.first_name
    elsif params[:select_address] == "1"
      ship = Address.find(params[:ship_address_id])
      @order.ship_postal_code = ship.postal_code
      @order.ship_address     = ship.address
      @order.ship_name       = ship.name
    elsif params[:select_address] == "2"
      @order.ship_postal_code = params[:ship_postal_code]
      @order.ship_address     = params[:ship_address]
      @order.ship_name        = params[:ship_name]
    end
  end

  def thanks
  end
  
  # 注文履歴詳細画面
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end



  private
  def order_params
    params.require(:order).permit(:ship_postal_code, :ship_address, :ship_name, :payment_method, :total_payment, :shipping_cost, :status)
  end
end
