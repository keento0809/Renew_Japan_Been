require 'test_helper'

class MemoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get memories_index_url
    assert_response :success
  end

  test "should get new" do
    get memories_new_url
    assert_response :success
  end

  test "should get edit" do
    get memories_edit_url
    assert_response :success
  end

end
