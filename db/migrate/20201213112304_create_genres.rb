class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :theme,    null: false
      t.integer :set_amount
      t.text :title1
      t.text :url1
      t.text :title2
      t.text :url2
      t.text :title2
      t.text :url2
      t.timestamps
    end
  end
end