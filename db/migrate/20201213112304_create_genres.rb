class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :theme,    null: false
      t.integer :set_amount
      t.timestamps
    end
  end
end