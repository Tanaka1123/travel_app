class BookmarkDetail < ApplicationRecord
  belongs_to :bookmark

  validates :time, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
