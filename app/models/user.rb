class User < ActiveRecord::Base
  before_save :encrypt_password

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :followable_users, class_name: "Follow", foreign_key: "followable_id"
  has_many :followers, class_name: "Follow", foreign_key: "follower_id"


  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end