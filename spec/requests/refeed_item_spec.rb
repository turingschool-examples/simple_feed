require 'spec_helper'

describe "Refeeding an item" do
  let!(:jeff) do
    if jeff = User.find_by_username('j3')
      jeff
    else
      User.create(:username => 'j3', :email => 'jeff@jumpstartlab.com')
    end
  end
  let!(:matt) do
    if matt = User.find_by_username('mattyoho')
      matt
    else
      User.create(:username => 'mattyoho', :email => 'matt@jumpstartlab.com', :password => 'hungry', :password_confirmation => 'hungry')
    end
  end

  context "when I am logged in" do
    before do
      visit login_path
      fill_in 'username', :with => 'mattyoho'
      fill_in 'password', :with => 'hungry'
      click_button 'Login'
    end

    context "when there is an item belonging to another user" do
      before do
        jeff.feed.feed_items << TextItem.new(:body => 'This is an item')
        jeff.save
      end

      context "when I view that user's feed" do
        before do
          visit feed_path('j3')
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
            visit feed_path('mattyoho')
            page.should have_content "This is an item"
          end
        end
      end
    end
  end
end

