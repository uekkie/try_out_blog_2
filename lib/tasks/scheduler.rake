desc "「いいね」数ランキングが10位までの投稿がメール通知"
task send_mail_likes_ranking: :environment do
  RankingMailSender.call
end
