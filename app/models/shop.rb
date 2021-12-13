class Shop < ApplicationRecord
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  attachment :food_image
  attachment :shop_image
  has_many :fix_requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :shop_favorites, dependent: :destroy
  has_many :timelines, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  geocoded_by :address
  after_validation :geocode

  # タグの保存
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_shop_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_shop_tag
    end
  end
end
