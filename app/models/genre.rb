class Genre < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :items, dependent: :destroy

  with_options presence: true do
    validates :theme, presence: true 
    validates :image, presence: true 
    validates :set_amount, presence: true 
  end

end