class CommentMailer < ApplicationMailer
  default from: 'hirocueki@gmail.com'

  def commented(comment)
    @comment = comment
    mail(
        subject: "#{comment.user.name}さんからコメントがつきました！",
        to: comment.post.user.email
    )
  end
end
