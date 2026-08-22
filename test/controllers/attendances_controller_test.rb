require "test_helper"

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get attend" do
    get attendances_attend_url
    assert_response :success
  end
end
