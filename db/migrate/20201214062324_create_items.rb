class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false 
      t.integer :price,             null: false 
      t.date :release_date 
      t.date :purchase_date 
      t.integer :category_id,       null: false 
      t.integer :quantity_id ,      null: false 
      t.integer :status_id,         null: false 
      t.references :user,           null: false, foreign_key: true 
      t.references :genre,          null: false, foreign_key: true 
      t.timestamps
    end
  end
end
