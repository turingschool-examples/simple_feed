class CreateTextItems < ActiveRecord::Migration
  def change
    add_column :feed_items, :type, :string
  end
end
