class Art < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader

    has_many :likes, dependent: :destroy
    has_many :liked_arts, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    geocoded_by :address
    after_validation :geocode
end
