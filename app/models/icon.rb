class Icon < ActiveHash::Base
  self.data = [
    { id: 1, name: 'アイコン1', image_path: 'icon_1.png' },
    { id: 2, name: 'アイコン2', image_path: 'icon_2.png' },
    { id: 3, name: 'アイコン3', image_path: 'icon_3.png' },
    { id: 4, name: 'アイコン4', image_path: 'icon_4.png' },
    { id: 5, name: 'アイコン5', image_path: 'icon_5.png' },
    { id: 6, name: 'アイコン6', image_path: 'icon_6.png' },
    { id: 7, name: 'アイコン7', image_path: 'icon_7.png' },
    { id: 8, name: 'アイコン8', image_path: 'icon_8.png' },
    { id: 9, name: 'アイコン9', image_path: 'icon_9.png' },
    { id: 10, name: 'アイコン10', image_path: 'icon_10.png' },
    { id: 11, name: 'アイコン11', image_path: 'icon_11.png' },
    { id: 12, name: 'アイコン12', image_path: 'icon_12.png' }
  ]

  include ActiveHash::Associations
  has_many :users
end