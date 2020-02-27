class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: {maximum: 140}

  scope :recent, -> { order(created_at: :desc) }

  def writen?(user)
    self.user == user
  end
end
