class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.integer :prefecture_id
      t.string :prefecture_name
      t.integer :check_id

      t.timestamps
    end
  end
end
