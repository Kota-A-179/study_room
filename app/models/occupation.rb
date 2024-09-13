class Occupation < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '事務' },
    { id: 3, name: '営業' },
    { id: 4, name: '販売' },
    { id: 5, name: '接客' },
    { id: 6, name: '医療' },
    { id: 7, name: '福祉' },
    { id: 8, name: '教育' },
    { id: 9, name: '製造' },
    { id: 10, name: '建設' },
    { id: 11, name: 'IT' },
    { id: 12, name: '土木' },
    { id: 13, name: '運輸' },
    { id: 14, name: '清掃' },
    { id: 15, name: '農林水産'}
  ]

  include ActiveHash::Associations
  has_many :users
end