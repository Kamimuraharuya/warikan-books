class Micropost < ApplicationRecord
	belongs_to :user
	mount_uploader :picture, PictureUploader
	validates :user_id, :bookname,:area,  :kakikomi, presence: true
	validates :day, :bookprice, numericality: {only_integer: true, less_than: 9999}, presence: true
	validates :content, length: { maximum: 140 }
	default_scope -> { order(created_at: :desc) }
	validate :picture_size


private
# アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end    

end
