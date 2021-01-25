class CreateBbs < ActiveRecord::Migration[6.0]
  def change
    create_table :bbs do |t|
      t.text :title,       null: false
      t.text :overview,    null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
