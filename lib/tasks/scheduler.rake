desc "「いいね」数ランキングが10位までの投稿がメール通知"
task ranking: :environment do
  PostMailer.likes_ranking().deliver
end
