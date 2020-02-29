class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { maximum: 200 }

  scope :older, -> { order(:created_at) }
end
