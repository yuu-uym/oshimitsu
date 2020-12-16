class Genre < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :items, dependent: :destroy

  validates :theme, presence: true 
  validates :image, presence: true 
  validates :set_amount, presence: true 
end