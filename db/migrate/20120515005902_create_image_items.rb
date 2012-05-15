class CreateImageItems < ActiveRecord::Migration
  def change
    add_column :feed_items, :image_url, :string, :length => 2048
  end
end
