require 'test_helper'

class FeedItemsControllerTest < ActionController::TestCase
  setup do
    @feed_item = feed_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feed_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feed_item" do
    assert_difference('FeedItem.count') do
      post :create, feed_item: { body: @feed_item.body, title: @feed_item.title }
    end

    assert_redirected_to feed_item_path(assigns(:feed_item))
  end

  test "should show feed_item" do
    get :show, id: @feed_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feed_item
    assert_response :success
  end

  test "should update feed_item" do
    put :update, id: @feed_item, feed_item: { body: @feed_item.body, title: @feed_item.title }
    assert_redirected_to feed_item_path(assigns(:feed_item))
  end

  test "should destroy feed_item" do
    assert_difference('FeedItem.count', -1) do
      delete :destroy, id: @feed_item
    end

    assert_redirected_to feed_items_path
  end
end
