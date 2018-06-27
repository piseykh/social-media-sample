module ApplicationHelper
  def belongs_to_user?(resource)
    resource.user == current_user
  end

  def is_current_user?(user)
    user == current_user
  end

  def followed_by(user)
    followers=current_user.followers
    friends =[]
    followers.each do |f|
      friends.push(f.followable_id)
    end
    friends.include? user.id
  end

  def likes_count(post)
    puts "=====likes_count"
    post.likes.count
  end

  def comments_count(post)
    puts "=====comments_count"
    post.comments.count
  end
end
