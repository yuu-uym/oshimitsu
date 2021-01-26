class Board < ApplicationRecord
  belongs_to :user
  has_many :comments

  def self.search(search)
    if search != ""
      Board.where('title LIKE(?)', "%#{search}%").or(Board.where('overview LIKE(?)', "%#{search}%"))
    else
      Board.all
    end
  end
end
