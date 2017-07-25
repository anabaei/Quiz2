class AddCntToLike < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :cnt, :integer
  end
end
