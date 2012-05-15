class CreateLinkItems < ActiveRecord::Migration
  def change
    add_column :feed_items, :link_url, :string, :length => 2048
  end
end
