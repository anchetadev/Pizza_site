class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :name
      t.string :desc
      t.integer :price
      t.string :size

      t.timestamps null: false
    end
  end
end
