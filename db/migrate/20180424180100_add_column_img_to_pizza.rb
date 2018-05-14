class AddColumnImgToPizza < ActiveRecord::Migration
  def change
    add_column :pizzas, :img, :string
  end
end
