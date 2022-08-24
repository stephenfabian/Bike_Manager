class AddShopToBikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :bikes, :shop, foreign_key: true
  end
end
