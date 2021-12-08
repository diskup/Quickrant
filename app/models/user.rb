class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shop
  has_many :review, dependent: :destroy
  has_many :schedule, dependent: :destroy
  has_many :fix_request, dependent: :destroy
  has_many :image
  has_many :timeline, dependent: :destroy
  has_many :image_favorite, dependent: :destroy
  has_many :timeline_favorite, dependent: :destroy
  has_many :shop_favorite, dependent: :destroy
  # ↓フォロー機能
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :reverse_of_relationships, source: :following
  has_many :followings, through: :relationships, source: :followed

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
