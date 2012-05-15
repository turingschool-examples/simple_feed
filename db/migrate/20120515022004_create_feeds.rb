class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end

    add_index :feeds, :user_id, unique: true, nil: false
    add_index :feeds, :name, unique: true, nil: false
    add_column :feed_items, :feed_id, :integer
  end
end
