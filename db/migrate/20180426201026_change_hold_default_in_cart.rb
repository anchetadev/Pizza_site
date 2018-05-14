class ChangeHoldDefaultInCart < ActiveRecord::Migration
  def change
    change_column_default(:carts, :hold, false)
  end
end
