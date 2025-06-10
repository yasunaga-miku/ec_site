class Book < ApplicationRecord
    validates :book_name, presence: true
    validates :author_name, presence: true
    validates :price, presence: true
    validates :status, presence: true

    #関連付け(カート)
    has_many :line_items, dependent: :destroy
    has_many :carts, through: :order_details

    #関連付け(注文)
    has_many :order_details
    has_many :orders, through: :order_details

    #adminがアップロードした写真を保持する
    has_one_attached :photo

    #画像を縦横200×200ピクセルにリサイズする
    def thumbnail
        unless photo.attached?
            #hoto.variantで画像を加工し、resize_to_fitで縦横比を維持したまま、指定したサイズにリサイズ
            file_path = Rails.root.join('app/assets/images/noimage.png')
            photo.attach(io: File.open(file_path), filename: 'noimage.png', content_type: 'image/jpeg')
        end
        photo.variant(resize_to_limit: [150,150]).processed
    end

    #Enum(販売状況)
    enum status: { on_sale: 0, sold_out: 1, test: 2 }

end
