class FeedsController < ApplicationController
  before_filter :require_login, :except => [:index]

  def index
    @feed_items = FeedItem.last_first(params[:page]).since(params[:since])

    respond_to do |format|
      format.html { render action: :show }
      format.json { render json: @feed_items }
    end
  end

  def show
    feed        = Feed.find_by_name!(params[:id])
    @feed_items = feed.feed_items.last_first(params[:page]).since(params[:since])

    respond_to do |format|
      format.html
      format.json { render json: @feed_items }
    end
  end

end
