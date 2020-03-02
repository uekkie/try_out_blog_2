# Preview all emails at http://localhost:3000/rails/mailers/post
class PostPreview < ActionMailer::Preview
  def likes_ranking
    users = User.where.not(email: '')
    posts = Post.order(likes_count: :desc).limit(10)
    PostMailer.likes_ranking(users, posts)
  end
end
