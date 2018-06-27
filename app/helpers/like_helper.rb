module LikeHelper
  def current_user_liked?(post)
    users = []
    likes = post.likes
    likes.each do |l|
      users.push(l.user_id)
    end
    users.include? current_user.id
  end
end