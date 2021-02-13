class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.integer :check_id
      t.boolean :been_to, default: false, null: false

      t.timestamps
    end
  end
end
