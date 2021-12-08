class Timeline < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :timeline_favorite, dependent: :destroy
end
