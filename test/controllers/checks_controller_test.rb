require 'test_helper'

class ChecksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get checks_new_url
    assert_response :success
  end

  test "should get create" do
    get checks_create_url
    assert_response :success
  end

end
