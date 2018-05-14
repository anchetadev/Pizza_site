class DorOrdersTable < ActiveRecord::Migration
  def up
    drop_table :orders
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
