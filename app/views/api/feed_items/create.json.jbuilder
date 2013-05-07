if @feed_item.persisted?
  json.partial! 'api/feed_items/item', item: @feed_item
else
  json.errors(@feed_item.errors.full_messages)
end

