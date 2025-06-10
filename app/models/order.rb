class Order < ApplicationRecord
    validates :quantity, presence: true
    validates :total, presence: true
    validates :delivery_address, presence: true

    #関連付け(注文と商品)
    has_many :order_details, dependent: :destroy
    has_many :books, through: :order_details

end
