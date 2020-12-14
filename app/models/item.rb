class Item < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  validates :genre_id, numericality: { other_than: 1 } 
end
