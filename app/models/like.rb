class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  scope :yesterday, -> { where(created_at: 1.day.ago.all_day) }
end
