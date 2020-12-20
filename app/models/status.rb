class Status < ActiveHash::Base

  self.date = [
    { id: 1, name: '--' },
    { id: 2, name: '新品、未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 3, name: '目立った傷や汚れなし' },
    { id: 3, name: 'やや傷や汚れあり' },
    { id: 3, name: '傷や汚れあり' },
    { id: 3, name: '全体的に状態が悪い' }
  ]
  
  include ActiveHash::Associations
  has_many :items
end
