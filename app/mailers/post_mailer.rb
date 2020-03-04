class PostMailer < ApplicationMailer
  default from: 'hirocueki@gmail.com'

  def likes_ranking(users, posts)
    @posts = posts

    if @post.present?
      mail(
        subject: "「いいね」デイリーランキング",
        to: users.pluck(:email)
      )
    end
  end
end
