class Timeline < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :timeline_favorites, dependent: :destroy
end
