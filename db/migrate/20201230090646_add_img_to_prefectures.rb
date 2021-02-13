class AddImgToPrefectures < ActiveRecord::Migration[6.0]
  def change
    add_column :prefectures, :img, :string
  end
end
