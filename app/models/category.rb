class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'グッズ' },
    { id: 3, name: 'チケット' },
    { id: 4, name: 'イベント' },
    { id: 5, name: '冊子' },
    { id: 6, name: 'DVD/Blu-ray' },
    { id: 7, name: 'CD' },
    { id: 8, name: '遠征費' },
    { id: 9, name: '課金' },
    { id: 10, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :items
end
