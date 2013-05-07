require 'spec_helper'

describe Api::FeedItemsController, t:true do
  describe 'show' do
    render_views

    let(:user1) { User.create! username: 'user1', password: 'abcdef', email: 'user1@example.com' }
    let(:user2) { User.create! username: 'user2', password: 'abcdef', email: 'user2@example.com' }
    let(:item)  { user1.feed.feed_item_of('link_item').create!(link_url: 'http://example.com', body: 'some text') }

    # auth
    before do
      controller.current_user = user1
      controller.stub :authenticate
    end

    it 'renders the item at that id, when it belongs to the specified user' do
      get 'show', format: :json, feed_id: user1.username, id: item.id # move to factories?
      response.status.should == 200
      json = JSON.parse response.body
      json['text'].should == item.body
      json['feed']['name'].should == user1.username
      json['user']['username'].should == user1.username
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
