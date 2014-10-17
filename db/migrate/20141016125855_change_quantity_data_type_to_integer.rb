class ChangeQuantityDataTypeToInteger < ActiveRecord::Migration
  def up
    change_column :cart_items, :quantity, :integer
  end

  def down
  end
end
