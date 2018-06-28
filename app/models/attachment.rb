class Attachment < ActiveRecord::Base
  belongs_to :post
  mount_uploader :file, AvatarUploader
end