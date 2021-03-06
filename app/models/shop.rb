class Shop < ApplicationRecord
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  attachment :food_image
  attachment :shop_image
  has_many :fix_requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :timelines, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  attr_accessor :average

  validates :name, presence: true
  validates :prefectures, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :minimum_price, presence: true
  validates :max_price, presence: true

  geocoded_by :address
  after_validation :geocode
  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude

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

  # 評価の平均
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  # 平均価格
  def avg_price
    (max_price + minimum_price) / 2
  end

  # 評価のパーセンテージ
  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
  # お気に入り
  def is_favorited_by?(user)
    favorites.find_by(user_id: user.id).present?
  end
  # def is_followed_by?(user)
  #   reverse_of_relationships.find_by(following_id: user.id).present?
  # end
end
