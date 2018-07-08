require 'test_helper'

class Managers::TopsControllerTest < ActionController::TestCase
  test "should get dash_board" do
    get :dash_board
    assert_response :success
  end

end
