class AddUserToAlllike < ActiveRecord::Migration[5.1]
  def change
    add_column :alllikes, :userid, :integer
  end
end
