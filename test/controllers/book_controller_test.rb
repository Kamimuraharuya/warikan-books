require 'test_helper'

class BookControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get book_home_url
    assert_response :success
  end

  test "should get help" do
    get book_help_url
    assert_response :success
  end

end
