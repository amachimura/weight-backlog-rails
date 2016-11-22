require 'test_helper'

class DailyWeightControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get record" do
    get :record
    assert_response :success
  end

end
