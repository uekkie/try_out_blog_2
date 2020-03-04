class PostMailer < ApplicationMailer
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
