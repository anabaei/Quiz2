class AddCntToAlllike < ActiveRecord::Migration[5.1]
  def change
    add_column :alllikes, :cnt, :integer
  end
end
