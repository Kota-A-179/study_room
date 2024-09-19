class Icon < ActiveHash::Base
  self.data = [
    { id: 1, name: '---', image_path: '' },
    { id: 2, name: '男子学生1', image_path: DefaultImageService.image_url(1) },
    { id: 3, name: '男子学生2', image_path: DefaultImageService.image_url(2) },
    { id: 4, name: '女子学生1', image_path: DefaultImageService.image_url(3) },
    { id: 5, name: '女子学生2', image_path: DefaultImageService.image_url(4) },
    { id: 6, name: '男性1', image_path: DefaultImageService.image_url(5) },
    { id: 7, name: '男性2', image_path: DefaultImageService.image_url(6) },
    { id: 8, name: '男性3', image_path: DefaultImageService.image_url(7) },
    { id: 9, name: '男性4', image_path: DefaultImageService.image_url(8) },
    { id: 10, name: '女性1', image_path: DefaultImageService.image_url(9) },
    { id: 11, name: '女性2', image_path: DefaultImageService.image_url(10) },
    { id: 12, name: '女性3', image_path: DefaultImageService.image_url(11) },
    { id: 13, name: '女性4', image_path: DefaultImageService.image_url(12) }
  ]

  include ActiveHash::Associations
  has_many :users
end