class FeedItemsController < ApplicationController
  before_filter :require_login, :except => [:index]

  def new
    @feed_item = FeedItem.new

    respond_to do |format|
      format.html
      format.json { render json: @feed_item }
    end
  end

  def edit
    @feed_item = current_user.feed.feed_items.find(params[:id])
  end

  def create
    kind = params[:feed_item].delete(:kind)
    @feed_item = current_user.feed.feed_item_of(kind).new(params[:feed_item])

    respond_to do |format|
      if @feed_item.save
        format.html { redirect_to current_user.feed, notice: 'Feed item was successfully created.' }
        format.json { render json: @feed_item, status: :created, location: @feed_item }
      else
        format.html { render action: "new" }
        format.json { render json: @feed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @feed_item = current_user.feed.feed_items.find(params[:id])

    respond_to do |format|
      if @feed_item.update_attributes(params[:feed_item])
        format.html { redirect_to current_user.feed, notice: 'Feed item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feed_item = current_user.feed.feed_items.find(params[:id])
    @feed_item.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
