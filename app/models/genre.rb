class Genre < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :theme, presence: true 
end
