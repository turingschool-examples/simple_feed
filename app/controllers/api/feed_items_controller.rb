module Api
  class FeedItemsController < ApiController

    before_filter :verify_feed_ownership, except: :index

    def show
      @feed_item = Feed.find_by_name!(params[:feed_id]).feed_items.where(id: params[:id]).first
      return head 404 unless @feed_item
      respond_to do |format|
        format.json
      end
    end

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
      kind = params[:item].delete(:type)
      @feed_item = current_user.feed.feed_item_of(kind).new(params[:item])

      respond_to do |format|
        if @feed_item.save
          format.json { render status: :created, location: api_feed_feed_item_url(current_user.feed, @feed_item) }
        else
          format.json { render status: :unprocessable_entity }
        end
      end
    end

    def update
      @feed_item = current_user.feed.feed_items.find(params[:id])
      @feed_item.attributes = params[:item]

      respond_to do |format|
        if @feed_item.save
          format.json { head :no_content }
        else
          format.json { render status: :unprocessable_entity }
        end
      end
    end

    private

    def verify_feed_ownership
      unless current_user.feed.name == params[:feed_id]
        head status: :unauthorized
      end
    end

  end
end

