class Admin::OrdersController < ApplicationController

  def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

	def index
		@orders = Order.all
	end



	def update
		@order = Order.find(params[:id])
		@order_detail = @order.order_details
		@order.update_(order_params)
		    if @order.status == "paied"
		     	 @order_detail.update(products_status: "waiting_for_pdoduction") #製作待ち
		    end
		   redirect_to admin_order_path(@order)
	

	end

  private
	def order_params
		  params.require(:order).permit(:status, :end_user_id, :ship_address, :ship_postal_code,
		  :ship_name, :shipping_cost, :total_payment, :payment_method)
	end
end
