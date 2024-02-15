require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select 'h2', 'Your Pragmatic Bookshelf'
    assert_select 'nav a', minimum: 4
    assert_select 'main ul li', 4
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select 'div', /\$[,\d]+\.\d\d/
  end
end

