class Order < ApplicationRecord
   belongs_to :end_user
  has_many :order_details, dependent: :destroy
  
  validates :end_user_id, :ship_address,:ship_name, :shipping_cost,
			  		:total_payment, :payment_method,
			  		presence: true
			  		
	enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {waiting: 0, paied: 1, making: 2, ready_to_ship: 3, shipped: 4}
  
end
