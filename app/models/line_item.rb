class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book
end
