class FeedItem < ActiveRecord::Base
  belongs_to :feed, inverse_of: :feed_items

  def self.last_first
    order("created_at DESC")
  end

  def kind
    read_attribute(:type) || "TextItem"
  end

  def username
    feed.name
  end

end
