# Preview all emails at http://localhost:3000/rails/mailers/post
class PostPreview < ActionMailer::Preview
  def likes_ranking
    users = User.exists_email
    posts = Post.likes_ranking_yesterday
    PostMailer.likes_ranking(users, posts)
  end
end
