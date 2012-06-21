class Feed < ActiveRecord::Base
  belongs_to :user, inverse_of: :feed
  has_many :feed_items, inverse_of: :feed
  has_many :image_items
  has_many :text_items
  has_many :link_items

  delegate :gravatar, to: :user

  def feed_item_of(kind)
    send(kind.tableize.to_sym)
  end

  def refeed(item)
    item_copy = item.dup
    feed_items << item_copy
  end

  def items_page_count(page_size=10)
    @items_page_count ||= begin
      pages, rem = feed_items.count.divmod(page_size)
      pages += 1 if rem > 0
      pages
    end
  end

  def to_param
    name
  end
end
