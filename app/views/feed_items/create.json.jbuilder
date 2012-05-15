if @feed_item.persisted?
  json.type @feed_item.type
  json.image_url @feed_item.image_url if @feed_item.image_url.present?
  json.link_url  @feed_item.link_url  if @feed_item.link_url.present?
  json.text @feed_item.body
  json.(@feed_item, :id, :created_at)
  json.link api_feed_feed_item_url(@feed_item.feed, @feed_item, format: :json)
  json.feed do |json|
    json.link api_feed_url(@feed_item.feed, format: :json)
    json.name @feed_item.feed.name
  end
  json.user do |json|
    json.username @feed_item.feed.user.username
    json.email @feed_item.feed.user.email
    json.gravatar @feed_item.feed.user.gravatar
  end
else
  json.errors(@feed_item.errors.full_messages)
end

