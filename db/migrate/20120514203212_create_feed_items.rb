class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.text :body
      t.string :title

      t.timestamps
    end
  end
end
