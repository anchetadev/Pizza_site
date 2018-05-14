class RemoveHoldFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :hold, :boolean
  end
end
