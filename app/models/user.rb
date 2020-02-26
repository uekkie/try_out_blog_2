class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z]+\Z/ }
  validates :profile, length: { maximum: 200 }

  def email_required?
    false
  end
end
