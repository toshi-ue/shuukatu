require 'test_helper'

class Public::TopsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get company" do
    get :company
    assert_response :success
  end

end
