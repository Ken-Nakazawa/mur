class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :uid
      t.integer :topic_id

      t.integer :rakuten_id
      t.string :item_name
      t.string :item_url
      t.string :itemimage_url

      t.timestamps
    end
  end
end
