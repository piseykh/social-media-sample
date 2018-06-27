class Post < ActiveRecord::Base
  mount_uploader :image1_url, AvatarUploader
  mount_uploader :image2_url, AvatarUploader
  mount_uploader :image3_url, AvatarUploader

  belongs_to :user
  has_many :comments
  has_many :likes
end