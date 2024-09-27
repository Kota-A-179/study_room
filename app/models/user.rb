class User < ApplicationRecord
  after_commit :assign_room, on: :create

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :occupation
  belongs_to :icon

  belongs_to :room, optional: true
  has_many :studies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英字と数字の両方を含んでください'}, if: -> {password.present?} 
  
  validates :status_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :icon_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :birthday, presence: true

  private
  def assign_room
    room = Room.all.includes(:users).find { |r| r.users.count < 10 } || Room.create(name: "#{Room.count + 1}")
    update(room_id: room.id)
    room
  end
end

