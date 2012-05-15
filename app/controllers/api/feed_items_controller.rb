module Api
  class FeedItemsController < ApiController

    def index
      feed        = Feed.find_by_name!(params[:feed_id])
      @feed_items = feed.feed_items.last_first(params[:page])

      last_page   = feed.items_page_count(10)
      next_page   = [(params[:page] || 1).to_i + 1, last_page].min

      next_url    = api_feed_feed_items_url(feed, page: next_page)
      last_url    = api_feed_feed_items_url(feed, page: last_page)
      link_header = construct_link_header(next_url, last_url)

      respond_to do |format|
        headers["Link"] = link_header
        format.json
      end
    end

    def create
      feed = Feed.find_by_name!(params[:feed_id])
      kind = params[:item].delete(:type)
      @feed_item = feed.feed_item_of(kind).new(params[:item])

      respond_to do |format|
        if @feed_item.save
          format.json { render status: :created, location: @feed_item }
        else
          format.json { render status: :unprocessable_entity }
        end
      end
    end

    def update
      feed = Feed.find_by_name!(params[:feed_id])
      kind = params[:item].delete(:type)
      @feed_item = feed.feed_item_of(kind).new(params[:item])

      respond_to do |format|
        if @feed_item.save
          format.json { head :no_content }
        else
          format.json { render status: :unprocessable_entity }
        end
      end
    end

  end
end

