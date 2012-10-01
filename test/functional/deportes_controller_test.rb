require 'test_helper'

class DeportesControllerTest < ActionController::TestCase
  setup do
    @deporte = deportes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deportes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deporte" do
    assert_difference('Deporte.count') do
      post :create, deporte: { descripcion: @deporte.descripcion, nombre: @deporte.nombre }
    end

    assert_redirected_to deporte_path(assigns(:deporte))
  end

  test "should show deporte" do
    get :show, id: @deporte
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deporte
    assert_response :success
  end

  test "should update deporte" do
    put :update, id: @deporte, deporte: { descripcion: @deporte.descripcion, nombre: @deporte.nombre }
    assert_redirected_to deporte_path(assigns(:deporte))
  end

  test "should destroy deporte" do
    assert_difference('Deporte.count', -1) do
      delete :destroy, id: @deporte
    end

    assert_redirected_to deportes_path
  end
end
