class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :shops, through: :tag_maps
end
