class Bookmark < ApplicationRecord
  belongs_to :user
  has_many :bookmark_details

  accepts_nested_attributes_for :bookmark_details

end

 

