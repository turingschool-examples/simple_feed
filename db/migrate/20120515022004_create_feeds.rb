class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end

    add_column :feed_items, :feed_id, :integer
  end
end
