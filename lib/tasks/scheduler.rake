desc "「いいね」数ランキングが10位までの投稿がメール通知"
task send_mail_likes_ranking: :environment do
  users = User.where.not(email: '')
  posts = Post.order(likes_count: :desc).limit(10)
  PostMailer.likes_ranking(users, posts)
end
