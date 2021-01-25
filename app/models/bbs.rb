class Bbs < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if search != ""
      Bbs.where('title LIKE(?)', "%#{search}%").or(Bbs.where('overview LIKE(?)', "%#{search}%"))
    else
      Bbs.all
    end
  end
end
