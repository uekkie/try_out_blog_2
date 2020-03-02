class CommentMailer < ApplicationMailer
  default from: 'hirocueki@gmail.com'

  def commented(comment)
    #@comment = comment
    #
    #unless comment.post.writer?(comment.user)
    #  mail(
    #      subject: "#{comment.user.name}さんからコメントがつきました！",
    #      to: comment.post.user.email
    #  )
    #end

    @comment = comment
    mail(subject: "#{comment.user.name}さんからコメントがつきました！", to: comment.post.user.email)
  end

  def hello
    mail(
        subject: "テストメール",
        to: "hirocueki@gmail.com"
    )
  end
end
