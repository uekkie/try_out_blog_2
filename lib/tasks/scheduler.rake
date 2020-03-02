desc "「いいね」数ランキングが10位までの投稿がメール通知"
task send_mail_likes_ranking: :environment do
  users = User.has_email
  posts = Post.likes_ranking_yesterday
  PostMailer.likes_ranking(users, posts)
end
