class DropColumnsFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :image1_url
    remove_column :posts, :image2_url
    remove_column :posts, :image3_url
  end
end
