class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :occupation
  belongs_to :icon
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :occupation_id, presence: true, numericality: { other_than: 1 }
  validates :icon_id, presence: true, numericality: { other_than: 1 }
  validates :birthday, presence: true
end

