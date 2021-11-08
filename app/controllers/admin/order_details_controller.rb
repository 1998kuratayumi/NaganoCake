class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
  		@order = @order_detail.order
		  if @order_detail.update(order_detail_params)
		    if @order_detail.products_status == "making"
		       @order.update(status: "making")
		    elsif @order.order_details.count ==  @order.order_details.where(products_status: "finished").count
				 @order.update(status: 3)
				end
				redirect_to admin_order_path(@order)
      else
		    render "show"
		  end
  end
  
  
  private
  def order_detail_params
		  params.require(:order_detail).permit(:products_status)
	end
end
