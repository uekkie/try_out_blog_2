desc "「いいね」数ランキングが10位までの投稿がメール通知"
task send_mail_likes_ranking: :environment do
  #RankingMailSender.call
  users = User.exists_email
  #return if users.blank?

  posts = Post.likes_ranking_yesterday
  #return if posts.blank?

  puts posts.pluck(:id)
  PostMailer.likes_ranking(users, posts)
end
