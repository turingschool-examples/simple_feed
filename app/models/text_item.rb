class TextItem < FeedItem
  attr_accessible :body, :title

  validates :body, presence: true, length: {minumum: 1, maximum: 256}

  def to_partial_path
    'feed_items/text_item'
  end

end
