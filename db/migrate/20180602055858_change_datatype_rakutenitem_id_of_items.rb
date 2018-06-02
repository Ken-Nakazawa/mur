class ChangeDatatypeRakutenitemIdOfItems < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :rakutenitem_id, :string
  end
end
