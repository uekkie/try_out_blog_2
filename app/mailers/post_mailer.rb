class PostMailer < ApplicationMailer
  def likes_ranking()
    @posts = Post.likes_ranking_yesterday
    users = User.exists_email

    if @posts.present?
      mail(
        subject: "「いいね」デイリーランキング",
        to: users.pluck(:email)
      )
    end
  end
end
