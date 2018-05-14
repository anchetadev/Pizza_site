class AddHoldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hold, :boolean
  end
end
