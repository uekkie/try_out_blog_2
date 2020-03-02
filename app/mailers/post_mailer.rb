class PostMailer < ApplicationMailer
  default from: 'hirocueki@gmail.com'

  def likes_ranking(users, posts)
    @posts = posts
    user_emails = users.pluck(:email)

    if user_emails.present?
      mail(
        subject: "「いいね」デイリーランキング",
        to: user_emails
      )
    end
  end
end
