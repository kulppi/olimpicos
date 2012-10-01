require 'test_helper'

class DelegacionesControllerTest < ActionController::TestCase
  setup do
    @delegacione = delegaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delegaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delegacione" do
    assert_difference('Delegacione.count') do
      post :create, delegacione: { olimpiada_id: @delegacione.olimpiada_id, pais: @delegacione.pais }
    end

    assert_redirected_to delegacione_path(assigns(:delegacione))
  end

  test "should show delegacione" do
    get :show, id: @delegacione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delegacione
    assert_response :success
  end

  test "should update delegacione" do
    put :update, id: @delegacione, delegacione: { olimpiada_id: @delegacione.olimpiada_id, pais: @delegacione.pais }
    assert_redirected_to delegacione_path(assigns(:delegacione))
  end

  test "should destroy delegacione" do
    assert_difference('Delegacione.count', -1) do
      delete :destroy, id: @delegacione
    end

    assert_redirected_to delegaciones_path
  end
end
