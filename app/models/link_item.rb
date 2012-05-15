class LinkItem < FeedItem
  attr_accessible :title, :body, :link_url

  validates :link_url, presence: true, format: /^https?:\/\/.+$/i, length: {maximum: 2048}
  validates :body, presence: true, length: {minumum: 1, maximum: 256}

  def to_partial_path
    'feed_items/link_item'
  end

end
