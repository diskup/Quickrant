class Shop < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :fix_requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :shop_favorites, dependent: :destroy
  has_many :timelines, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  # タグの保存
  def save_shops(tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end
    new_tags.each do |new_name|
      shop_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << shop_tag
    end
  end 
end
