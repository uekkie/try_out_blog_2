# Preview all emails at http://localhost:3000/rails/mailers/comment
class CommentPreview < ActionMailer::Preview
  def commented
    comment = Comment.last
    CommentMailer.commented(comment)
  end
end
