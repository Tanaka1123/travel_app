class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true, format: { with: /\A.*\z/, message: "is invalid. Input half-width characters." }
         has_many :bookmarks, dependent: :destroy
end
