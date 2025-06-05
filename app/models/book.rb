class Book < ApplicationRecord
    validates :book_name, presence: true
    validates :author_name, presence: true
    validates :price, presence: true
    validates :status, presence: true
end
