module Api
  class FeedItemsController < ApiController

    def index
      if params[:feed_id]
        feed        = Feed.find_by_name!(params[:feed_id])
        @feed_items = feed.feed_items.last_first(params[:page])

        last_page   = feed.items_page_count(10)
        next_page   = [(params[:page] || 1).to_i + 1, last_page].min

        next_url    = api_feed_feed_items_url(feed, page: next_page)
        last_url    = api_feed_feed_items_url(feed, page: last_page)
        link_header = construct_link_header(next_url, last_url)
      else
        @feed_items = FeedItem.last_first(params[:page])

        last_page   = FeedItem.items_page_count(10)
        next_page   = [(params[:page] || 1).to_i + 1, last_page].min

        next_url    = api_feed_items_url(page: next_page)
        last_url    = api_feed_items_url(page: last_page)
        link_header = construct_link_header(next_url, last_url)
      end

      respond_to do |format|
        headers["Link"] = link_header
        format.json
      end
    end

    private

    def construct_link_header(next_url, last_url)
      "<#{next_url}>; rel=\"next\", <#{last_url}>; rel=\"last\""
    end
  end
end

