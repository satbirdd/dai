require 'test_helper'

class StockPropertiesControllerTest < ActionController::TestCase
  setup do
    @stock_property = stock_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_property" do
    assert_difference('StockProperty.count') do
      post :create, stock_property: {  }
    end

    assert_redirected_to stock_property_path(assigns(:stock_property))
  end

  test "should show stock_property" do
    get :show, id: @stock_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_property
    assert_response :success
  end

  test "should update stock_property" do
    patch :update, id: @stock_property, stock_property: {  }
    assert_redirected_to stock_property_path(assigns(:stock_property))
  end

  test "should destroy stock_property" do
    assert_difference('StockProperty.count', -1) do
      delete :destroy, id: @stock_property
    end

    assert_redirected_to stock_properties_path
  end
end
