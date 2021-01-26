class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :text, presence: true
end
