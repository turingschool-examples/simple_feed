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

  def to_param
    name
  end
end
