require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should prompt for login" do
    get login_url
    assert_response :success 
  end

  test "should login" do
    julia = users(:one)
    post login_url, params: { name: julia.name, password: 'secret' } 
    assert_redirected_to admin_url
    assert_equal julia.id, session[:user_id]
  end
end
