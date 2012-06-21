class RefeedsController < ApplicationController

  def create
    feed_item = FeedItem.find(params[:feed_item_id])
    current_user.feed.refeed(feed_item)

    redirect_to feed_path(current_user.feed)
  end

end
