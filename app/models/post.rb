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

  def self.order_by_ids(ids)
    order_by = ["case"]
    ids.each_with_index.map do |id, index|
      order_by << "WHEN id='#{id}' THEN #{index}"
    end
    order_by << "end"
    order(order_by.join(" "))
  end

  def self.likes_ranking_yesterday(limit = 10)
    ids = Like.yesterday
        .more_than_likes_posts
        .limit(limit)
        .pluck(:post_id)
    Post.where(id: ids).order_by_ids(ids)
  end
end
