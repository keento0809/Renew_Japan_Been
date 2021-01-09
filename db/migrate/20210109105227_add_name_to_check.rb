class AddNameToCheck < ActiveRecord::Migration[6.0]
  def change
    add_column :checks, :prefecture_name, :string
  end
end
