require 'spec_helper'

describe Api::FeedItemsController, t:true do
  describe 'show' do
    let(:user1) { User.create! username: 'user1', password: 'abcdef' }
    let(:user2) { User.create! username: 'user2', password: 'abcdef' }
    let(:item)  { user1.feed.feed_item_of('link_item').create!(link_url: 'http://example.com', body: 'some text') }

    # auth
    before do
      controller.current_user = user1
      controller.stub :authenticate
    end

    it 'renders the item at that id, when it belongs to the specified user' do
      # move to factories?
      get 'show', feed_id: user1.username, id: item.id
      response.status.should == 200
      json = JSON.parse response.body
      json['body'].should == 'some text'
      # json['feed']['username']
    end

    it '401s when the user is trying to view a feed not belonging to them' do
      get 'show', feed_id: user2.username, id: item.id
      response.status.should == 401
    end

    it '404s when the item does not belong to the specified user' do
      get 'show', feed_id: user1.username, id: 1_000_000
      response.status.should == 404
    end
  end
end
