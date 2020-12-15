class Genre < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :items

  validates :theme, presence: true 
end
