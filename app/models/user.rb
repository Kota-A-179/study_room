class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :occupation
  belongs_to :icon

  has_one :room_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英字と数字の両方を含んでください'}, if: -> {password.present?} 
  
  validates :status_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :icon_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :birthday, presence: true
end

