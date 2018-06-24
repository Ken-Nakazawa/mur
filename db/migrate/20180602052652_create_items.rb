class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :rakutenitem_id
      t.string :item_name
      t.string :item_url
      t.string :itemimage_url

      t.timestamps
    end
  end
end
