require 'spec_helper'

describe RefeedsController do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:feed) { user.feed }
  let!(:item) { FactoryGirl.create(:text_item) }

  before { controller.stub(:current_user => user) }

  describe "#create" do

    it "refeeds the item onto the user's feed" do
      feed.should_receive(:refeed).with(item)
      post :create, feed_item_id: item.id
    end

    pending "redirects to the user's feed" do
      post :create, feed_item_id: item.id
      response.should redirect_to(feed)
    end
  end
end

