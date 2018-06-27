class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text "content_text", null: false
      t.string "image1_url"
      t.string "image2_url"
      t.string "image3_url"
      t.references :user, index:true
      t.timestamps
    end
  end
end
