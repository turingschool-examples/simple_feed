json.array!(@feed_items) do |json, item|
  json.partial! 'api/feed_items/item', item: item
end

