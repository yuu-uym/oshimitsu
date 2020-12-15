class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '購入済み' },
    { id: 3, name: '絶対欲しい' },
    { id: 4, name: '気になる' },
  ]
  include ActiveHash::Associations
  has_many :items
end
