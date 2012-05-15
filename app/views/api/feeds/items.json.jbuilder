json.array!(@feed_items) do |json, item|
  json.type item.type
  json.image_url item.image_url if item.image_url.present?
  json.link_url  item.link_url  if item.link_url.present?
  json.text item.body
  json.(item, :id, :created_at)
  json.link api_feed_feed_item_url(item.feed, item, format: :json)
  json.feed do |json|
    json.link api_feed_url(item.feed, format: :json)
    json.name item.feed.name
  end
  json.user do |json|
    json.username item.feed.user.username
    json.email item.feed.user.email
    json.gravatar item.feed.user.gravatar
  end
end

