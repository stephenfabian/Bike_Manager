class CreateBikeShops < ActiveRecord::Migration[5.2]
  def change
    create_table :bike_shops do |t|
      t.string :name
      t.integer :rank
      t.boolean :bike_rentals
    end
  end
end
