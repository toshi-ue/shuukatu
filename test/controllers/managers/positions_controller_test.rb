require 'test_helper'

class Managers::PositionsControllerTest < ActionController::TestCase
  setup do
    @managers_position = managers_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:managers_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create managers_position" do
    assert_difference('Managers::Position.count') do
      post :create, managers_position: { address: @managers_position.address, description: @managers_position.description, latitude: @managers_position.latitude, longitude: @managers_position.longitude, shopper_id: @managers_position.shopper_id, title: @managers_position.title }
    end

    assert_redirected_to managers_position_path(assigns(:managers_position))
  end

  test "should show managers_position" do
    get :show, id: @managers_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @managers_position
    assert_response :success
  end

  test "should update managers_position" do
    patch :update, id: @managers_position, managers_position: { address: @managers_position.address, description: @managers_position.description, latitude: @managers_position.latitude, longitude: @managers_position.longitude, shopper_id: @managers_position.shopper_id, title: @managers_position.title }
    assert_redirected_to managers_position_path(assigns(:managers_position))
  end

  test "should destroy managers_position" do
    assert_difference('Managers::Position.count', -1) do
      delete :destroy, id: @managers_position
    end

    assert_redirected_to managers_positions_path
  end
end
