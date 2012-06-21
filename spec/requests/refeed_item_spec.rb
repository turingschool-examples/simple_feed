require 'spec_helper'

describe "Refeeding an item" do
  let!(:jeff) { FactoryGirl.create(:jeff) }
  let!(:matt) { FactoryGirl.create(:matt) }

  context "when I am logged in" do
    before do
      login('mattyoho', 'hungry')
    end

    context "when there is an item belonging to another user" do
      before do
        jeff.feed.feed_items << TextItem.new(:body => 'This is an item')
        jeff.save
      end

      context "when I view that user's feed" do
        before do
          visit feed_path(jeff.feed)
        end

        it "I see a refeed button" do
          within(".feed-item") do
            page.should have_link('Refeed')
          end
        end

        context "when I click to refeed" do
          before do
            within(".feed-item") do
              click_link('Refeed')
            end
          end

          it "shows up in my feed" do
            visit feed_path(matt.feed)
            page.should have_content "This is an item"
          end
        end
      end
    end
  end
end

