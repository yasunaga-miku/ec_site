class Book < ApplicationRecord
    validates :book_name, presence: true
    validates :author_name, presence: true
    validates :price, presence: true
    validates :status, presence: true

    #ユーザがアップロードした写真を保持する
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

end
