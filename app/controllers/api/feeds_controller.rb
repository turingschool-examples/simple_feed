module Api
  class FeedsController < ApiController

    def show
      @feed = Feed.find_by_name!(params[:id])

      respond_to do |format|
        format.json
      end
    end

    def items
      @feed_items = FeedItem.last_first(params[:page])

      last_page   = FeedItem.items_page_count(10)
      next_page   = [(params[:page] || 1).to_i + 1, last_page].min

      next_url    = items_api_feeds_url(page: next_page)
      last_url    = items_api_feeds_url(page: last_page)
      link_header = construct_link_header(next_url, last_url)

      respond_to do |format|
        headers["Link"] = link_header
        format.json
      end
    end


  end
end

