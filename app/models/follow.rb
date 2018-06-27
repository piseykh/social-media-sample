class Follow < ActiveRecord::Base
  belongs_to :followable, :class_name => "User"
  belongs_to :follower, :class_name => "User"
end