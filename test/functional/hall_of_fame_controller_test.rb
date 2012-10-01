require 'test_helper'

class HallOfFameControllerTest < ActionController::TestCase
  test "should get nombre:string" do
    get :nombre:string
    assert_response :success
  end

  test "should get pais:string" do
    get :pais:string
    assert_response :success
  end

  test "should get numOro:integer" do
    get :numOro:integer
    assert_response :success
  end

end
