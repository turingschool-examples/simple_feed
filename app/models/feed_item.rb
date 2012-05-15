class FeedItem < ActiveRecord::Base
  belongs_to :feed, inverse_of: :feed_items

  paginates_per 10

  def self.last_first(page=1)
    page = (page || 1).to_i
    order("created_at DESC").page(page)
  end

  def self.most_recent(n=5)
    last_first.limit(n)
  end

  def kind
    read_attribute(:type) || "TextItem"
  end

  def username
    feed.name
  end

end
