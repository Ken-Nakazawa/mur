class RenameTopicIdColumnToFavorites < ActiveRecord::Migration[5.1]
  def change
    rename_column :favorites, :topic_id, :item_id
  end
end
