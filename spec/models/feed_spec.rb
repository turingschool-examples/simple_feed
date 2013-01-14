require 'spec_helper'

describe Feed do
  describe "#refeed" do
    let(:feed) { FactoryGirl.create(:user).feed }
    let(:item) { FactoryGirl.create(:text_item) }

    it "adds an item to itself" do
      expect { feed.refeed(item) }.to change { feed.feed_items.count }.by(1)
    end
  end
end
