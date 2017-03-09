class Micropost < ApplicationRecord
	belongs_to :user
	has_many :likes, dependent: :destroy
	mount_uploader :picture, PictureUploader
	validates :user_id, :bookname,:area,  :kakikomi, presence: true
	validates :day, :bookprice, numericality: {only_integer: true, less_than: 9999}, presence: true
	validates :content, length: { maximum: 300 }
	default_scope -> { order(created_at: :desc) }
	validate :picture_size

def like_user(user_id)
   likes.find_by(user_id: user_id)
  end


private
# アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "写真の容量が大きすぎます")
      end
    end    

end
