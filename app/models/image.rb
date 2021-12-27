class Image < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  attachment :food_image
  attachment :shop_image
  validates :shop_image_or_food_image, presence: true

  private
    def shop_image_or_food_image
      food_image.presence or shop_image.presence
    end
end
