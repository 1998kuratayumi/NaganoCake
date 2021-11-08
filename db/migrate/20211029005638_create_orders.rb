class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer "end_user_id"
      t.string "ship_address"
      t.string "ship_postal_code"
      t.string "ship_name"
      t.integer "shipping_cost", default: 500
      t.integer "total_payment"
      t.integer "payment_method", default: 0
      t.integer "status", default: 0
      t.timestamps
    end
  end
end
