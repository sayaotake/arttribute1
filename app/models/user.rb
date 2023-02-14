class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :arts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_arts, through: :likes, source: :art
  has_many :comments, dependent: :destroy
  has_many :arts, dependent: :destroy
  validates :name, presence: true 
  validates :admin, presence: true
  validates :profile, length: { maximum: 200 }

  def already_liked?(art)
    self.likes.exists?(art_id: art.id)
  end
end
