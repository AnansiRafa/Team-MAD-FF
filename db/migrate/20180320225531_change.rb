class Change < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :price, :price_in_cents
  end
end
