class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.float :discount
      t.integer :quantity
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
