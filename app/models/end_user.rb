class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
           
  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :addresses, dependent: :destroy
         
  validates :first_name, :last_name, :first_name_kana, :last_name_kana,
            :zip_code, :address, :telephone_number, :email,
            presence: true
end
