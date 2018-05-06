require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get employee" do
    get :employee
    assert_response :success
  end

  test "should get manager" do
    get :manager
    assert_response :success
  end

end
