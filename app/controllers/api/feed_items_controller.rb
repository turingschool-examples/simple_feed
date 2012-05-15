module Api
  class FeedItemsController < ApiController

    def index
      @feed_items = if params[:feed_id]
        Feed.find_by_name!(params[:feed_id]).feed_items
      else
        FeedItem
      end.last_first(params[:page])

      respond_to do |format|
        format.json
      end
    end

  end
end

