class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :attachments, dependent: :delete_all
end