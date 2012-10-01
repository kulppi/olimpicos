require 'test_helper'

class SectoresControllerTest < ActionController::TestCase
  setup do
    @sectore = sectores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sectores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sectore" do
    assert_difference('Sectore.count') do
      post :create, sectore: { estadio_id: @sectore.estadio_id, nombre: @sectore.nombre }
    end

    assert_redirected_to sectore_path(assigns(:sectore))
  end

  test "should show sectore" do
    get :show, id: @sectore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sectore
    assert_response :success
  end

  test "should update sectore" do
    put :update, id: @sectore, sectore: { estadio_id: @sectore.estadio_id, nombre: @sectore.nombre }
    assert_redirected_to sectore_path(assigns(:sectore))
  end

  test "should destroy sectore" do
    assert_difference('Sectore.count', -1) do
      delete :destroy, id: @sectore
    end

    assert_redirected_to sectores_path
  end
end
