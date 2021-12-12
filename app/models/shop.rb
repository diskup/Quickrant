class Shop < ApplicationRecord
  belongs_to :user
  has_many :image, dependent: :destroy
  has_many :fix_request, dependent: :destroy
  has_many :review, dependent: :destroy
  has_many :schedule, dependent: :destroy
  has_many :shop_favorite, dependent: :destroy
  has_many :timeline, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
end
