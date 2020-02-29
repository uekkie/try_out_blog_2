class CommentMailer < ApplicationMailer
  default from: 'hirocueki@gmail.com'

  def commented
    @post = params[:post]
    mail(to: @post.user.email, subject: 'コメントがつきました！')
  end
end
