class AddCommentToPrefectures < ActiveRecord::Migration[6.0]
  def change
    add_column :prefectures, :comment, :string
  end
end
