class Bookmark < ApplicationRecord
  belongs_to :user

  validates :time, presence: true
  validates :location, presence: true
  validates :description, presence: true
end