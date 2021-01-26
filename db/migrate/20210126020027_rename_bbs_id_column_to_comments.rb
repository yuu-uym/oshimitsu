class RenameBbsIdColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :bbs_id, :board_id
  end
end
