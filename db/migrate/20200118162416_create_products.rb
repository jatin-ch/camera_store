class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.text :description
      t.float :price
      t.integer :make

      t.timestamps
    end
  end
end
