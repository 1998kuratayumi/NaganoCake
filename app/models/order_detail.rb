class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum products_status: {not_statable: 0, waiting_for_pdoduction: 1, making: 2, finished: 3}
end
