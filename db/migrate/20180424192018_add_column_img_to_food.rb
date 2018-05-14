class AddColumnImgToFood < ActiveRecord::Migration
  def change
    add_column :foods, :img, :string
  end
end
