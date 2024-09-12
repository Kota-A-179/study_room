class Icon < ActiveHash::Base
  self.data = [
    { id: 1, name: '---', image_path: '' },
    { id: 2, name: '男子学生1', image_path: 'icon_1.png' },
    { id: 3, name: '男子学生2', image_path: 'icon_2.png' },
    { id: 4, name: '女子学生1', image_path: 'icon_3.png' },
    { id: 5, name: '女子学生2', image_path: 'icon_4.png' },
    { id: 6, name: '男性1', image_path: 'icon_5.png' },
    { id: 7, name: '男性2', image_path: 'icon_6.png' },
    { id: 8, name: '男性3', image_path: 'icon_7.png' },
    { id: 9, name: '男性4', image_path: 'icon_8.png' },
    { id: 10, name: '女性1', image_path: 'icon_9.png' },
    { id: 11, name: '女性2', image_path: 'icon_10.png' },
    { id: 12, name: '女性3', image_path: 'icon_11.png' },
    { id: 13, name: '女性4', image_path: 'icon_12.png' }
  ]

  include ActiveHash::Associations
  has_many :users
end