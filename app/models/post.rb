class Post < ApplicationRecord
  belongs_to :user
  
  validates :self_comment, presence: true, length: { maximum: 255 }
end
