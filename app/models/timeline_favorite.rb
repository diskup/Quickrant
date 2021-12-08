class TimelineFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :timeline
end
