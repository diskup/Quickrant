class Image < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  attachment :food_image
  attachment :shop_image
end
