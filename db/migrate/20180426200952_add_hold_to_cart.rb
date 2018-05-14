class AddHoldToCart < ActiveRecord::Migration
  def change
    add_column :carts, :hold, :boolean
  end
end
