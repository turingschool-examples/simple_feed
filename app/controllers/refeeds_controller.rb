class RefeedsController < ApplicationController

  def create
    feed_item = FeedItem.find(params[:feed_item_id])
    feed = current_user.feed
    feed.refeed(feed_item)

    redirect_to feed_path(feed)
  end

end
