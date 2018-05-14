class ChangeHoldDefault < ActiveRecord::Migration
  def change
    change_column_default(:users, :hold, false)
  end
end
