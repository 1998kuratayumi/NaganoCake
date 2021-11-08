class Item < ApplicationRecord

  belongs_to :genre
	has_many :cart_items
  attachment :image

  def with_tax_price
    (no_tax_price * 1.1).floor
  end
  
  def self.search(keyword)
    if keyword.present?
      where(["name like?", "%#{keyword}%"])
    else
      Item.all
    end
  end
  
end