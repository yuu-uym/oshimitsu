class Genre < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :items, dependent: :destroy

  with_options presence: true do
    validates :theme
    validates :image
    
    validates :set_amount, numericality: { only_integer: true}
  end

end