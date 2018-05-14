class CreatePizzaOrders < ActiveRecord::Migration
  def change
    create_table :pizza_orders do |t|
      t.references :pizza, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
