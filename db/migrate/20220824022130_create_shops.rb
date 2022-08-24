class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.boolean :full_suspension
      t.integer :travel_length

      t.timestamps
    end
  end
end
