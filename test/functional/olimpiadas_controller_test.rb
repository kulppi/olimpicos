require 'test_helper'

class OlimpiadasControllerTest < ActionController::TestCase
  setup do
    @olimpiada = olimpiadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:olimpiadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create olimpiada" do
    assert_difference('Olimpiada.count') do
      post :create, olimpiada: { ano: @olimpiada.ano, fecha_inicio: @olimpiada.fecha_inicio, fecha_termino: @olimpiada.fecha_termino, lugar: @olimpiada.lugar }
    end

    assert_redirected_to olimpiada_path(assigns(:olimpiada))
  end

  test "should show olimpiada" do
    get :show, id: @olimpiada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @olimpiada
    assert_response :success
  end

  test "should update olimpiada" do
    put :update, id: @olimpiada, olimpiada: { ano: @olimpiada.ano, fecha_inicio: @olimpiada.fecha_inicio, fecha_termino: @olimpiada.fecha_termino, lugar: @olimpiada.lugar }
    assert_redirected_to olimpiada_path(assigns(:olimpiada))
  end

  test "should destroy olimpiada" do
    assert_difference('Olimpiada.count', -1) do
      delete :destroy, id: @olimpiada
    end

    assert_redirected_to olimpiadas_path
  end
end
