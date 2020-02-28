class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  validates :content, presence: true, length: {maximum: 140}

  scope :recent, -> { order(created_at: :desc) }

  def writer?(user)
    self.user == user
  end

  def liked_user?(user)
    likes.find_by(user_id: user.id)
  end
end
