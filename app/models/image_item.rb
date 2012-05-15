class ImageItem < FeedItem
  attr_accessible :title, :body, :image_url

  validates :image_url, presence: true, format: /^https?:\/\/.+\.(?:jpg|jpeg|gif|png)$/i, length: {maximum: 2048}
  validates :body, length: {minumum: 1, maximum: 256}

  def to_partial_path
    'feed_items/image_item'
  end

end
