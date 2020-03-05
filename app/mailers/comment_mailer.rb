class CommentMailer < ApplicationMailer
  def commented(comment)
    @comment = comment

    unless comment.post.writer?(comment.user)
      mail(
          subject: "#{comment.user.name}さんからコメントがつきました！",
          to: comment.post.user.email
      )
    end
  end
end
