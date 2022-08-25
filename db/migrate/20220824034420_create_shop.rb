class CreateShop < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :rank
      t.boolean :rentals

      t.timestamps
    end
  end
end
