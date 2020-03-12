class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: {maximum: 140}

  has_many :likes_create_with_in_yesterday,
           -> { where(created_at: 1.day.ago.all_day) },
           class_name: 'Like'

  scope :recent, -> { order(created_at: :desc) }

  mount_uploader :image, PostUploader

  def writer?(user)
    self.user == user
  end

  def liked_user?(user)
    likes.find_by(user_id: user.id)
  end

  def self.likes_ranking_yesterday(limit = 10)
    Post.joins(:likes_create_with_in_yesterday)
      .group(:id)
      .order(Arel.sql('COUNT(likes.id) DESC'))
      .limit(limit)
  end
end
