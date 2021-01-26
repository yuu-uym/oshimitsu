class RenameBbsToBoard < ActiveRecord::Migration[6.0]
  def change
    rename_table :bbs, :boards
  end
end
