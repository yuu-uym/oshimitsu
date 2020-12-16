class Item < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  
  validates :genre_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 

  def sum_of_price
    price * quantity_id
  end

  def total_price
    array = {}
    Item.all.each do |item|
      array[item.price ] = item.quantity_id
    end
      array.map {|key, val| key * val }.sum
  end

  class << self
    def purchase_price
        array = {}
        @item =Item.all
        @purchase = @item.where(status_id: '2')
        @purchase.each do |item|
        array[item.price ] = item.quantity_id
        end
        array.map {|key, val| key * val }.sum
    end
  end
  
end
