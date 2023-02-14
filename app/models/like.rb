class Like < ApplicationRecord
  belongs_to :art
  belongs_to :user

  validates_uniqueness_of :art_id, scope: :user_id
end
