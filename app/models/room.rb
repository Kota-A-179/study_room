class Room < ApplicationRecord
  has_many :room_users
  
  validates :name, presence: true
end
