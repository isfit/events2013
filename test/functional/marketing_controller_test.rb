require 'test_helper'

class MarketingControllerTest < ActionController::TestCase
  test "should get poster" do
    get :poster
    assert_response :success
  end

end
