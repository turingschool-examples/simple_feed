json.name @feed.name
json.(@feed, :id, :created_at)

json.user do |json|
  json.username @feed.user.username
  json.email @feed.user.email
  json.gravatar @feed.user.gravatar
end

json.link api_feed_url(@feed, format: :json)

json.items do |json|
  json.pages @feed.items_page_count(10)
  json.first_page api_feed_feed_items_url(@feed, page: 1, format: :json)
  json.last_page api_feed_feed_items_url(@feed, page: @feed.items_page_count(10), format: :json)
  json.most_recent(@feed.feed_items.last_first) do |json, recent_item|
    json.type recent_item.type
    json.image_url recent_item.image_url if recent_item.image_url.present?
    json.link_url  recent_item.link_url  if recent_item.link_url.present?
    json.text recent_item.body
    json.(recent_item, :id, :created_at)
    json.feed api_feed_url(@feed, format: :json)
    json.link api_feed_feed_item_url(@feed, recent_item, format: :json)
  end
end

json.web_url url_for(@feed)
