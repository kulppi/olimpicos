require 'test_helper'

class MedallasControllerTest < ActionController::TestCase
  setup do
    @medalla = medallas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medallas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medalla" do
    assert_difference('Medalla.count') do
      post :create, medalla: { disciplina_id: @medalla.disciplina_id, jugador_id: @medalla.jugador_id, tipo_medalla_id: @medalla.tipo_medalla_id }
    end

    assert_redirected_to medalla_path(assigns(:medalla))
  end

  test "should show medalla" do
    get :show, id: @medalla
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medalla
    assert_response :success
  end

  test "should update medalla" do
    put :update, id: @medalla, medalla: { disciplina_id: @medalla.disciplina_id, jugador_id: @medalla.jugador_id, tipo_medalla_id: @medalla.tipo_medalla_id }
    assert_redirected_to medalla_path(assigns(:medalla))
  end

  test "should destroy medalla" do
    assert_difference('Medalla.count', -1) do
      delete :destroy, id: @medalla
    end

    assert_redirected_to medallas_path
  end
end
