require 'test_helper'

class AnnotationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get annotations_create_url
    assert_response :success
  end

end
