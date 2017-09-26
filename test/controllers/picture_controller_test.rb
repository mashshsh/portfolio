require 'test_helper'

class PictureControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get picture_index_url
    assert_response :success
  end

end
