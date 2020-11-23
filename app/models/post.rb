class Post < ApplicationRecord
  belongs_to :user
  
  validates :self_comment, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  has_many  :favorites, dependent: :destroy
  
  mount_uploader :image, ImageUploader

end
