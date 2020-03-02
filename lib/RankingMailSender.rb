class RankingMailSender
  def call
    users = User.exists_email
    return false if users.blank?

    posts = Post.likes_ranking_yesterday
    return false if posts.blank?

    PostMailer.likes_ranking(users, posts)
  end
end
