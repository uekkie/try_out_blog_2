class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: {maximum: 140}

  scope :recent, -> { order(created_at: :desc) }

  mount_uploader :image, PostUploader

  def writer?(user)
    self.user == user
  end

  def liked_user?(user)
    likes.find_by(user_id: user.id)
  end

  def self.likes_ranking_yesterday(limit = 10)
    Post.find(
      Like.yesterday
        .group(:post_id)
        .order(count: :desc)
        .limit(limit)
        .pluck(:post_id)
    )
  end
end
