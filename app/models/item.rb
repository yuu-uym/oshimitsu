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

   class << self
    def must_price
        array = {}
        @item =Item.all
        @purchase = @item.where(status_id: '3')
        @purchase.each do |item|
        array[item.price ] = item.quantity_id
        end
        array.map {|key, val| key * val }.sum
    end
  end

    class << self
    def concern_price
        array = {}
        @item =Item.all
        @purchase = @item.where(status_id: '4')
        @purchase.each do |item|
        array[item.price ] = item.quantity_id
        end
        array.map {|key, val| key * val }.sum
    end
  end


    class << self
      def purchase_price_month
        array = {}
        @item = Item.all
        @purchase = @item.where(status_id: '2')
        @purchase_month = @purchase.where('purchase_date LIKE(?)', "%#{Time.now.month}%")
        @purchase_year = @purchase_month.where('purchase_date LIKE(?)', "%#{Time.now.year}%")
        @purchase_year.each do |item|
        array[item.price ] = item.quantity_id
        end
        array.map {|key, val| key * val }.sum
      end
   end

   def user
    return User.find_by(id: self.user_id)
  end

  end
