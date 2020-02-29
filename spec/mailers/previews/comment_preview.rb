# Preview all emails at http://localhost:3000/rails/mailers/comment
class CommentPreview < ActionMailer::Preview
  def commented
    user = User.new(name: '侍 太郎', email: 'samurai@example.com')
    post = user.posts.new(content: "つぶやき")

    CommentMailer.with(post: post).commented
  end
end
